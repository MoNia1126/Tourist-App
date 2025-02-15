import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_app/views/blocs/theme/theme_bloc.dart';
import 'package:tourist_app/views/blocs/theme/theme_event.dart';
import 'package:tourist_app/views/blocs/theme/theme_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeBloc>().state is DarkThemeState;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppLocalizations.of(context)!.theme,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isDarkTheme
                      ? AppLocalizations.of(context)!.darkTheme
                      : AppLocalizations.of(context)!.lightTheme,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                const SizedBox(width: 10),
                Switch(
                  value: isDarkTheme,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

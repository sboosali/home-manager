{ pkgs

  # Extra path to Home Manager. If set then this path will be tried
  # before `$HOME/.config/nixpkgs/home-manager` and
  # `$HOME/.nixpkgs/home-manager`.
, path ? null
}:

let

  pathStr = if path == null then "" else path;

in

pkgs.runCommand
  "home-manager"
  {
    meta = with pkgs.stdenv.lib; {
      description = "A user environment configurator";
      maintainers = [ maintainers.rycee ];
      platforms = platforms.unix;
      license = licenses.mit;
    };
  }
  ''
    install -v -D -m755  ${./home-manager} $out/bin/home-manager

    substituteInPlace $out/bin/home-manager \
      --subst-var-by bash "${pkgs.bash}" \
      --subst-var-by coreutils "${pkgs.coreutils}" \
      --subst-var-by findutils "${pkgs.findutils}" \
      --subst-var-by gnused "${pkgs.gnused}" \
      --subst-var-by less "${pkgs.less}" \
      --subst-var-by HOME_MANAGER_PATH '${pathStr}'
  ''

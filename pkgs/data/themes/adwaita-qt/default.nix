{ mkDerivation, lib, fetchFromGitHub, nix-update-script, cmake, ninja, qtbase, pantheon, qtx11extras }:

mkDerivation rec {
  pname = "adwaita-qt";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "FedoraQt";
    repo = pname;
    rev = version;
    sha256 = "gMM8JzSVsl8LRXB2oTJykeuyPe1tKfMhfA2DtfvHfV0=";
  };

  nativeBuildInputs = [
    cmake
    ninja
  ];

  buildInputs = [
    qtbase
    qtx11extras
  ];

  QT_PLUGINS_DIR = "$qtPluginPrefix";

  passthru = {
    updateScript = nix-update-script {
      attrPath = pname;
    };
  };

  meta = with lib; {
    description = "A style to bend Qt applications to look like they belong into GNOME Shell";
    homepage = "https://github.com/FedoraQt/adwaita-qt";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ worldofpeace ];
    platforms = platforms.linux;
  };
}

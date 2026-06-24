struct MoviesToWatch {
    wolverine: String;
    redFunnyGuy: String
}

fun main() : Int {
    let m = MoviesToWatch{ wolverine: "Blade Runner", redFunnyGuy: "Ryan Reynolds" };
    return m.wolverine == "Blade Runner" ? 1 : 0;
}

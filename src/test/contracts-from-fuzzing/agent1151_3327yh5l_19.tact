struct Str {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
    g: String;
    h: String;
}

contract LotsOfStrings {
    s: Str;
    init() {
        self.s = Str{
            a:"a", b:"b", c:"c", d:"d",
            e:"e", f:"f", g:"g", h:"h"
        };
    }
}
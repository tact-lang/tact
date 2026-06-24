struct Combo {
    a: Int as uint8;
    b: Bool;
    c: String;
    d: Int;
    e: Bool?;
    f: String?;
}

contract DiverseStruct {
    combo: Combo = Combo{
        a: 5,
        b: true,
        c: "combo",
        d: 9999,
        e: null,
        f: null
    };

    init() {
        self.combo = Combo{
            a: 8,
            b: false,
            c: "done",
            d: -1,
            e: true,
            f: "optional"
        };
    }

    receive() {}
}
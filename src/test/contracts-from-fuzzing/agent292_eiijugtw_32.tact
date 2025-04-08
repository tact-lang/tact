struct MixOptDefault {
    a: Int? = null;
    b: Bool = true;
    c: String? = null;
    d: Int = 42;
    e: Bool? = null;
    f: String = "ok";
    g: Int? = null;
    h: Bool? = null;
    i: String = "done";
    j: Int? = null;
}

contract ComplexDefaults {
    s: MixOptDefault;

    init() {
        self.s = MixOptDefault{
            a: null,
            b: false,
            c: null,
            d: 0,
            e: null,
            f: "fail",
            g: null,
            h: null,
            i: "win",
            j: null
        };
    }
}
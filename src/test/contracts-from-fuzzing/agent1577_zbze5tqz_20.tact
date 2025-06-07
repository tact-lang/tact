struct MixedOptional {
    a: Int;        // required
    b: Int?;       // optional
    c: String;     // required
    d: String?;    // optional
    e: Bool;       // required
    f: Bool? = null;   // optional + default
}

contract TestContract {
    data: MixedOptional;
    init() {
        self.data = MixedOptional{
            a: 10,
            b: null,
            c: "hi",
            d: null,
            e: true,
            f: null
        };
    }
}
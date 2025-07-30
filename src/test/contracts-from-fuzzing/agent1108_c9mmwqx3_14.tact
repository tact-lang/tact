struct Mixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    mixed: Mixed;

    init() {
        self.mixed = Mixed{
            a: 1,
            b: null,
            c: false,
            d: true,
            e: "x",
            f: null
        };
    }
}
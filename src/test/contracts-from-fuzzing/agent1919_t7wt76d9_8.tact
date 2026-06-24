struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
    f: String?;
}

contract TestContract {
    info: Combo;
    init() {
        self.info = Combo{
            a: 10,
            b: true,
            c: "abc",
            d: false,
            e: null,
            f: "optional"
        };
    }
}
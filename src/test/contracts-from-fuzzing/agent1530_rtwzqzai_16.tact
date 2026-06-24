struct ManyMixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    val: ManyMixed;

    init() {
        self.val = ManyMixed{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: "hi",
            f: null
        };
    }
}

struct Combo {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
    e: Bool?;
    f: String?;
}

contract ComboTest {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: null,
            c: "hi",
            d: true,
            e: false,
            f: null
        };
    }
}

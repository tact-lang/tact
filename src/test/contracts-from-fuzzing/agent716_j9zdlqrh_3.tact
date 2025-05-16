struct Combo {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract ComboFieldsTest {
    item: Combo;

    init() {
        self.item = Combo{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "hi",
            f: null
        };
    }
}
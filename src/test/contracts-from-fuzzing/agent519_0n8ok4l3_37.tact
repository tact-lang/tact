struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract ComboFieldsContract {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "str",
            f: null
        };
    }
}
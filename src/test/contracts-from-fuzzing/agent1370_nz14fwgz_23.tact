struct Multi {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: String?;
}

contract ComboTest {
    myfield: Multi;

    init() {
        self.myfield = Multi{
            a: 1,
            b: false,
            c: "hi",
            d: null,
            e: null,
            f: "end",
            g: null
        };
    }
}
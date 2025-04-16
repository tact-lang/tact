struct Flat {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract FlatStruct {
    val: Flat;

    init() {
        self.val = Flat{
            a: 1,
            b: null,
            c: "a",
            d: null,
            e: false,
            f: null
        };
    }
}
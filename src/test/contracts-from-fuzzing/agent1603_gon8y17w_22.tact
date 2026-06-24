struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract AllTypeStruct {
    m: Mix;

    init() {
        self.m = Mix{
            a: 42,
            b: true,
            c: "str",
            d: null,
            e: false,
            f: null
        };
    }
}
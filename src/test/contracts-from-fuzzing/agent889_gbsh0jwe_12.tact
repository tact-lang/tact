struct SomeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

contract UsesStructDefaults {
    s: SomeStruct;

    init() {
        self.s = SomeStruct{
            a: 10,
            b: false,
            c: "hi",
            d: null,
            e: null,
        };
    }
}
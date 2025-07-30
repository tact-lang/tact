struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract NullableInsideStruct {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 123,
            b: null,
            c: "foo",
            d: null
        };
    }
}

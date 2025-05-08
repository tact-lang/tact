message(99) ComplexMsg {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalInsideMsg {
    myMsg: ComplexMsg = ComplexMsg{ foo: null, bar: true, baz: "ok" };

    init() {
        self.myMsg = ComplexMsg{ foo: 5, bar: null, baz: null };
    }
}
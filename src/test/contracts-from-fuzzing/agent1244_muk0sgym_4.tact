struct Param {
    foo: Int;
    bar: Bool;
}

contract OptionalStructField {
    optParam: Param?;

    init() {
        self.optParam = null;
    }
}

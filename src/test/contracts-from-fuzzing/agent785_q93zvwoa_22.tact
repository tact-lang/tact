struct Nested {
    innerVal: Bool;
    innerStr: String;
}

contract OptionalBetween {
    a: Int;
    optNested: Nested?;
    b: Int;

    init() {
        self.a = 1;
        self.optNested = null;
        self.b = 2;
    }
}
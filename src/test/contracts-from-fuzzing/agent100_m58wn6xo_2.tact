struct Nest {
    y: Int;
}

contract NestedStructField {
    s: Nest;

    init() {
        self.s = Nest{ y: 42 };
    }
}

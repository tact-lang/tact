struct NestedEarly {
    foo: Int?;
}

contract EarlyNulls {
    s: NestedEarly?;
    init() {
        self.s = null;
    }
}
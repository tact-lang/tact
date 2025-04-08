struct Inner {
    p1: Int;
    p2: Bool;
    p3: String?;
}

contract NestedStructVars {
    s: Inner;

    init() {
        self.s = Inner{
            p1: 5,
            p2: true,
            p3: null
        };
    }
}
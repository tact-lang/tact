struct Second {
    s: String;
    a: Int = 4;
}

struct Outer {
    inner: Second;
}

contract NestedDefaults {
    st: Outer;
    init() {
        self.st = Outer { inner: Second { s: "hi" } };
    }
    receive() {}
}
struct Second {
    s: String?
}

struct Outer {
    inner: Second?;
}

contract NestedOptStruct {
    st: Outer;
    init() {
        self.st = Outer { inner: null };
    }
    receive() {}
}
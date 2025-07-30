struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner?;
}

contract OptNestedStruct {
    st: Outer;

    init() {
        self.st = Outer{ inner: null };
    }
}
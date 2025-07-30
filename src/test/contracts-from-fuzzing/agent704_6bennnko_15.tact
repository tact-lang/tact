struct Inner {
    f: Int?;
}

struct Outer {
    inner: Inner?;
}

contract DoubleNestedOptionals {
    value: Outer?;

    init() {
        self.value = Outer{ inner: Inner{f: null} };
    }
}
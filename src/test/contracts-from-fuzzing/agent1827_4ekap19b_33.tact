struct A {
    x: Int;
}

struct B {
    inner: A?;
}

contract OptionalStructNested {
    s: B;

    init() {
        self.s = B{ inner: null };
    }
}
struct A {
    val: Int;
}

struct B {
    maybeA: A?;
}

contract OptionalStructField {
    f: B;

    init() {
        self.f = B{ maybeA: null };
    }
}
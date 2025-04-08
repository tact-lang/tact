struct A {
    x: Int?;
}

struct B {
    a: A?;
}

contract NestedNulls {
    b: B?;

    init() {
        self.b = null;
    }
}

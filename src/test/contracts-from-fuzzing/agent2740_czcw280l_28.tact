struct A {
    f: Int?;
}

struct B {
    nested: A?;
}

contract NestedMultiOpt {
    f: B?;

    init() {
        self.f = null;
    }
}
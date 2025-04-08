struct A {
    u: Int?;
}

struct B {
    a: A?;
    flag: Bool;
}

contract NestedOptionalsCombined {
    storage: B;

    init() {
        self.storage = B{
            a: null,
            flag: true,
        };
    }
}

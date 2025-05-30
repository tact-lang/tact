struct A {
    x: Int;
}

struct B {
    f: A;
}

struct C {
    g: B;
}

contract NestedThreeLevels {
    data: C;

    init() {
        self.data = C{ g: B{ f: A{ x: 999 } } };
    }
}
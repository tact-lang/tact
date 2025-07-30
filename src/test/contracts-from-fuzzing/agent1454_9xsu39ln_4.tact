struct C {
    valC: Int?;
}

struct B {
    innerC: C;
}

struct A {
    innerB: B;
}

contract NestedDeeper {
    nested: A;

    init() {
        self.nested = A{ innerB: B{ innerC: C{ valC: null } } };
    }
}
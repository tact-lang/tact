struct A { val: Int }
struct B { aval: A }
struct C { bval: B }

contract ReassignNested {
    nested: C;

    init() {
        self.nested = C{ bval: B{ aval: A{ val: 42 } } };
        self.nested = C{ bval: B{ aval: A{ val: 7 } } };
    }
}
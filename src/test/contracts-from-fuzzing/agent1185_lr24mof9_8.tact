struct A {
    x: Int;
}

struct B {
    y: A?;
}

struct C {
    z: B?;
}

contract NestedOptionalStructs {
    d: C;
    init() {
        self.d = C{z:null};
    }
}
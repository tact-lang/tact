struct A {
    val: Int;
}

struct B {
    val: Bool;
}

struct C {
    a: A;
    b: B;
}

contract NestedMultipleStructs {
    stor: C;

    init() {
        self.stor = C{
            a: A{val:1},
            b: B{val:true}
        };
    }
}

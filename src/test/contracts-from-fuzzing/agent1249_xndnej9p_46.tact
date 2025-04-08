struct A {
    val: Int;
}

struct B {
    x: Int;
    y: Int;
}

contract MixedStructs {
    aField: A;
    bField: B;

    init() {
        self.aField = A{val:1};
        self.bField = B{x:2, y:3};
    }
}
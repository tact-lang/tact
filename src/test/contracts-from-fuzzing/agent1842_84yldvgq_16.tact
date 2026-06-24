struct A {
    x: Int;
    y: Bool;
    z: String;
}

struct B {
    a1: A;
    a2: A;
}

contract DoubleNestedStruct {
    nested: B;

    init() {
        self.nested = B {
            a1: A{x: 1, y: true, z: "one"},
            a2: A{x: 2, y: false, z: "two"},
        };
    }
}
struct A {
    x: Int;
    y: Int;
}

struct B {
    point: A;
    z: Int;
}

contract NestedStruct {
    data: B;

    init() {
        self.data = B{ point: A{ x: 5, y: 10 }, z: 20 };
    }
}
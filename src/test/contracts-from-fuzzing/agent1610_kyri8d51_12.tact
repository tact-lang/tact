struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    z: Int;
}

contract ManyStructs {
    arr1: A;
    arr2: B;

    init() {
        self.arr1 = A{ x: 1, y: 2 };
        self.arr2 = B{ a: A{ x: 3, y:4 }, z:5 };
    }
}
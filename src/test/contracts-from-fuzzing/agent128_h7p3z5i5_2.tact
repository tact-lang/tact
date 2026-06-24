struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    flag: Bool;
}

contract StructInStruct {
    b: B;

    init() {
        self.b = B{ a: A{ x: 10, y: false }, flag: true };
    }
}
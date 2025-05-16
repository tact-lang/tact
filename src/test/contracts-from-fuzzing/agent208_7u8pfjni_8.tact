struct A {
    x: Int as int8;
    y: Int as uint8;
    z: Bool;
}

struct B {
    a1: A;
    a2: A;
    flag: Bool;
}

contract Test9 {
    st: B;

    init() {
        self.st = B{
            a1: A{ x: -10, y: 20, z: true },
            a2: A{ x: 30, y: 40, z: false },
            flag: true
        };
    }
}
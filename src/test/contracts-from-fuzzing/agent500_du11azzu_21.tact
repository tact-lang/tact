struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    z: Int;
}

struct NestedLarge {
    a: A;
    b: B;
    c: C;
    flag: Bool;
}

contract MultiNestedStructTest {
    data: NestedLarge;
    init() {
        self.data = NestedLarge{
            a: A{ x:1 },
            b: B{ y:2 },
            c: C{ z:3 },
            flag: true
        };
    }
    receive() {}
}
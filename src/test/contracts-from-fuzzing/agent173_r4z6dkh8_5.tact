struct A {
    x: Int;
    y: Bool?;
}

struct B {
    a: A;
    extra: Int;
}

struct C {
    b: B;
    flag: Bool;
}

contract Wrapped {
    data: C;

    init() {
        self.data = C{
            b: B{ a: A{ x: 1, y: null }, extra: 12345 },
            flag: true
        };
    }
}
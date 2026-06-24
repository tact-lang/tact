struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    z: String?;
}

struct C {
    data: B;
    flag: Bool;
}

contract TestC {
    payload: C;

    init() {
        self.payload = C{
            data: B{
                a: A{ x: 1, y: false },
                z: null
            },
            flag: true
        };
    }
}
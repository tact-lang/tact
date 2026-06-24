struct A {
    s: String;
    b: Bool;
}

struct B {
    a1: A;
    a2: A;
    flag: Bool;
}

contract DoubleStructs {
    data: B;

    init() {
        self.data = B{
            a1: A{ s: "one", b: true },
            a2: A{ s: "two", b: false },
            flag: true
        };
    }
}
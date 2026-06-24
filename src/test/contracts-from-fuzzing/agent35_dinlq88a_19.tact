struct A {
    a: Int?;
    b: Bool;
}

struct B {
    a: Int;
    b: Bool?;
}

struct C {
    a: Int;
    b: Bool;
    optA: A?;
    optB: B?;
}

contract TestContract {
    complex: C;

    init() {
        self.complex = C{
            a: 1,
            b: true,
            optA: null,
            optB: null
        };
    }
}
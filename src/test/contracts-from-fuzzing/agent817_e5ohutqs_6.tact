struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct Container {
    a: A?;
    b: B?;
    flag: Bool;
}

contract Test {
    c: Container;

    init() {
        self.c = Container {
            a: null,
            b: B{ y: 7 },
            flag: true
        };
    }
}
struct A {
    a: Int;
}

struct B {
    b: Int;
    nested: A;
}

struct C {
    first: A;
    second: B;
}

contract TestContract {
    storage: C = C{
        first: A{a:1},
        second: B{b:2, nested: A{a:3}}
    };

    init() {
        self.storage = C{
            first: A{a:10},
            second: B{b:20, nested: A{a:30}}
        };
    }
    receive() {}
}
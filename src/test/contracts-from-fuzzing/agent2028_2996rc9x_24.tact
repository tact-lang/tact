struct A {
    value: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
    text: String;
}

contract NestedABC {
    data: C;

    init() {
        self.data = C{
            b: B{ a: A{ value: 777 } },
            text: "abc"
        };
    }
}

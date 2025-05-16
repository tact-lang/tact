struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    s: String;
}

contract NestedMixed {
    data: B;

    init() {
        self.data = B{
            a: A{x: 10, y: true},
            s: "hello"
        };
    }
}
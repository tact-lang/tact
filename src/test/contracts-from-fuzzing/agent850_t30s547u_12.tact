struct A {
    s: String;
    b: Bool;
}

struct B {
    a: A;
    s2: String;
}

contract NestedStrings {
    data: B;

    init() {
        self.data = B{
            a: A{ s: "one", b: true },
            s2: "two",
        };
    }
}
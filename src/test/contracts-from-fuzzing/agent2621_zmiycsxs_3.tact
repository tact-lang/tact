struct A {
    n: Int;
    s: String?;
    b: Bool;
}

struct B {
    info: String;
    nested: A;
}

contract Test {
    b: B;
    init() {
        self.b = B{
            info: "info",
            nested: A{
                n: 5,
                s: null,
                b: true
            }
        };
    }
}
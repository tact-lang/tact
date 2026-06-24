struct A {
    s: String;
    o: String?;
}

struct B {
    a: A;
    o2: Int?;
}

contract NestedOptionals {
    b: B;

    init() {
        self.b = B{
            a: A{
                s: "text",
                o: null,
            },
            o2: null,
        };
    }
}
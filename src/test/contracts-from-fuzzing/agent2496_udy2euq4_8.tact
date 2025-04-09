struct A {
    s1: String;
    b1: Bool;
    optInt: Int?;
}

struct B {
    s2: String;
    flag: Bool?;
    nestedA: A;
}

contract DeepCombo {
    nested: B;

    init() {
        self.nested = B{
            s2: "xyz",
            flag: null,
            nestedA: A{
                s1: "abc",
                b1: true,
                optInt: 999,
            },
        };
    }
}

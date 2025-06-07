struct A {
    v1: Int;
    v2: Bool;
}

struct B {
    v3: String;
    v4: Int;
}

struct Combo {
    a: A;
    b: B;
    flag: Bool;
}

contract NestedCombo {
    data: Combo;

    init() {
        self.data = Combo{
            a: A{ v1: 11, v2: true },
            b: B{ v3: "hello", v4: 22 },
            flag: false
        };
    }
}
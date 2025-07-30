contract MixedDefaults {
    root: A;

    init() {
        self.root = A{
            b: B{
                c: null,
                flag: false
            },
            label: "root"
        };
    }
}

struct A {
    b: B;
    label: String;
}

struct B {
    c: C?;
    flag: Bool;
}

struct C {
    x: Int = 99;
    y: Int?;
}

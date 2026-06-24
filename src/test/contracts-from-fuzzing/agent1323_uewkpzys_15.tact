struct DeepOptionals {
    a: NestedA?;
}

struct NestedA {
    b: NestedB?;
}

struct NestedB {
    c: NestedC?;
}

struct NestedC {
    x: Int?;
}

contract VeryNestedOptionals {
    s: DeepOptionals;

    init() {
        self.s = DeepOptionals{
            a: null
        };
    }
}

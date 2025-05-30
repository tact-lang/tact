struct First {
    x: Int;
}

struct Second {
    y: Bool;
}

struct Third {
    z: String;
}

struct NestedMany {
    a: First;
    b: Second;
    c: Third;
}

contract TestContract {
    nm: NestedMany;

    init() {
        self.nm = NestedMany{
            a: First{ x: 1 },
            b: Second{ y: true },
            c: Third{ z: "hi" }
        };
    }
}
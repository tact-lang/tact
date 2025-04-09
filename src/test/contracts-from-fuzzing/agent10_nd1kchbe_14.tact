struct First {
    x: Int;
}

struct Second {
    a: Int;
    f: First;
}

struct Third {
    s: Second;
}

contract NestedMixed {
    val: Third;

    init() {
        self.val = Third{
            s: Second{
                a: 100,
                f: First{ x: 200 }
            }
        };
    }
}
struct Third {
    z: Int = 3;
}

struct Second {
    y: Int = 2;
    t: Third = Third{};
}

struct First {
    x: Int = 1;
    s: Second = Second{};
}

contract TestDeepNested {
    nested: First = First{};

    init() {
        self.nested = First{
            x: 100,
            s: Second{
                y: 200,
                t: Third{z: 300}
            }
        };
    }
}
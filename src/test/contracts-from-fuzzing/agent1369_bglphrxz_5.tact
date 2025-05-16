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

contract TestOptDeepNested {
    nestedOpt: First? = null;

    init() {
        self.nestedOpt = First{
            x: 100,
            s: Second{
                y: 200,
                t: Third{z: 300}
            }
        };
    }
}
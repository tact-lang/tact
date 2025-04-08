struct One {
    x: Int;
}

struct Two {
    a: One;
    b: One;
}

struct Three {
    left: Two;
    right: Two;
}

contract WideNested {
    nest: Three;

    init() {
        self.nest = Three{
            left: Two{ a: One{x:1}, b: One{x:2} },
            right: Two{ a: One{x:3}, b: One{x:4} },
        };
    }
}

struct One {
    a: Int;
}
struct Two {
    a: Int;
    b: Bool;
}
struct Three {
    x: One;
    y: Two;
}

contract ComplexOrdering {
    x: Three;

    init() {
        self.x = Three{
            x: One{a:1 },
            y: Two{ a:2, b:true }
        };
    }
}
struct Mid {
    x: Int;
    y: String?;
}

struct Top {
    a: Mid?;
    b: Bool;
    c: String;
}

contract NestedOptionals {
    container: Top;

    init() {
        self.container = Top{
            a: Mid{x: 123, y: null},
            b: true,
            c: "hi"
        };
    }
}
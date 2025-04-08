struct Mid {
    a: Bool;
    b: String;
    c: Int;
}

struct Root {
    x: Int;
    y: Mid;
    z: Bool;
}

contract TestContract {
    field: Root;

    init() {
        self.field = Root{
            x: 10,
            y: Mid{
                a: false,
                b: "nested",
                c: 42
            },
            z: true
        };
    }
}
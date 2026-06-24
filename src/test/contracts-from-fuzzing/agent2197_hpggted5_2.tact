struct BigComposite {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int?;
    e: NestedComposite;
}

struct NestedComposite {
    x: Bool;
    y: Int?;
}

contract C {
    data: BigComposite;

    init() {
        self.data = BigComposite{
            a: 5,
            b: true,
            c: null,
            d: 10,
            e: NestedComposite{
                x: false,
                y: null
            }
        };
    }
}
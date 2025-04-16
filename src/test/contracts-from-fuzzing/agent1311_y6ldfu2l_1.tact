struct InnerMost {
    v: Int?;
}

struct Inner {
    a: Bool?;
    b: InnerMost?;
}

struct Outer {
    x: Int;
    y: Inner?;
}

contract DeeplyNestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: 10,
            y: Inner{
                a: true,
                b: InnerMost{ v: 123 },
            },
        };
    }
}
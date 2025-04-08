struct Nested {
    x: Int;
    y: Bool?;
}

struct Outer {
    p: Nested;
    flag: Bool;
}

contract DeepOptional {
    data: Outer;

    init() {
        self.data = Outer{
            p: Nested{
                x: 42,
                y: null,
            },
            flag: false,
        };
    }
}
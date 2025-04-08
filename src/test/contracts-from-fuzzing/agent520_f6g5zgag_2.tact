struct InnerMost {
    x: Int = 1;
    y: Bool = true;
}

struct Nested {
    inner: InnerMost;
    flag: Bool = false;
    comment: String = "hi";
}

struct Top {
    nested: Nested;
    optionalVal: Int?;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            nested: Nested{
                inner: InnerMost{
                    x: 99,
                    y: false,
                },
                flag: true,
                comment: "hello",
            },
            optionalVal: null,
        };
    }

    receive() {}
}
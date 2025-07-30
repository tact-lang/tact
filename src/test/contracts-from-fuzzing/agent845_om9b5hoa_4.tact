struct Inner {
    x: Int?;
    y: String;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract DuplicateNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            first: Inner{
                x: null,
                y: "one"
            },
            second: Inner{
                x: 42,
                y: "two"
            }
        };
    }
}
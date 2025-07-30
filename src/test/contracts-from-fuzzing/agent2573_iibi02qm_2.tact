struct Inner {
    optInt: Int?;
    optBool: Bool?;
}

struct Outer {
    inner: Inner;
    text: String;
}

contract OptNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                optInt: null,
                optBool: true,
            },
            text: "Nested Optionals",
        };
    }
}
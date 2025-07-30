struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inr: Inner;
    str: String?;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inr: Inner{
                x: null,
                y: true,
            },
            str: "hello",
        };
    }
}
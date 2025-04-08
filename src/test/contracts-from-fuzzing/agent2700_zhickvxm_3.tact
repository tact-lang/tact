struct Inner {
    flag: Bool;
    number: Int;
}

struct Outer {
    first: Inner;
    second: Inner;
    text: String;
}

contract DeepStructs {
    nested: Outer;

    init() {
        self.nested = Outer{
            first: Inner{ flag: true, number: 7 },
            second: Inner{ flag: false, number: 42 },
            text: "test"
        };
    }
}
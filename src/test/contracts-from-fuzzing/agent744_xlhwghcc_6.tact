struct OptionalNested {
    nested: Inner?;
}

struct Inner {
    text: String;
    num: Int?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: Inner{ text: "hello", num: null }
        };
    }
}
struct DeepOpt {
    foo: Int?;
    bar: Bool;
    nested: NestedOpt;
}

struct NestedOpt {
    x: String;
    y: Int?;
}

contract DeepOptions {
    d: DeepOpt;
    init() {
        self.d = DeepOpt{
            foo: null,
            bar: false,
            nested: NestedOpt{
                x: "hi",
                y: null
            }
        };
    }
}
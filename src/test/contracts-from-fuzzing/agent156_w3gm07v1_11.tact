struct DeepOptional {
    a: Int;
    b: Bool;
    c: String;
}

struct WrapperOptional {
    inner: DeepOptional?;
}

contract NestedOptionInitOnly {
    persistent: WrapperOptional;

    init() {
        self.persistent = WrapperOptional{
            inner: DeepOptional{ a: 5, b: true, c: "hi" }
        };
    }
}
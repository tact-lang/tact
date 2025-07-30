struct DeepOpt {
    foo: Int?;
    bar: Bool?;
}

struct Wrapping {
    inner: DeepOpt?;
}

contract OptionNest {
    s: Wrapping;

    init() {
        self.s = Wrapping{
            inner: null
        };
    }
}
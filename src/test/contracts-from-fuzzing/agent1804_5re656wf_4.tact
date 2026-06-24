struct DeepOpt {
    inner: Int?;
    nestedOpt: Level1?;
}

struct Level1 {
    foo: Int;
}

contract OptionalNested {
    s: DeepOpt;

    init() {
        self.s = DeepOpt{
            inner: null,
            nestedOpt: null
        };
    }
}
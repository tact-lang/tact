struct DeepNested {
    x: Int;
    opt: Bool?;
}

struct MidNested {
    inner: DeepNested;
    flag: Bool;
}

contract TestContract {
    nested: MidNested;

    init() {
        self.nested = MidNested{
            inner: DeepNested{
                x: 42,
                opt: null,
            },
            flag: false,
        };
    }
}
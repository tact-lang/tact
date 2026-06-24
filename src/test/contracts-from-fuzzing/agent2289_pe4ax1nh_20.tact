struct DeepDeep {
    detail: String?;
    sign: Bool;
    num: Int;
}

struct Wrap {
    inner: DeepDeep;
    label: String?;
}

contract NestedOptDefaults {
    wrapped: Wrap;

    init() {
        self.wrapped = Wrap{
            inner: DeepDeep{
                detail: null,
                sign: true,
                num: 123
            },
            label: "hi"
        };
    }
}
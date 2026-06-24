struct DeeplyNestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrappedOptional {
    inner: DeeplyNestedOptional?;
    flag: Bool;
}

contract OptionalsTest {
    storage: WrappedOptional;

    init() {
        self.storage = WrappedOptional{
            inner: null,
            flag: true,
        };
    }
}
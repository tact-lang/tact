struct DeepNested {
    inner: Inner;
}

struct Inner {
    innermost: Innermost;
}

struct Innermost {
    flag: Bool;
    value: Int?;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Inner{
                innermost: Innermost{
                    flag: true,
                    value: 42,
                }
            }
        };
    }
}

struct DeepNested {
    inner: InnerOptional;
}

struct InnerOptional {
    opt: NestedOptional?;
}

struct NestedOptional {
    num: Int;
    flag: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerOptional{
                opt: NestedOptional{
                    num: 42,
                    flag: false
                }
            }
        };
    }
}

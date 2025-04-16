struct DeepNested3 {
    value: Int;
}

struct DeepNested2 {
    inner: DeepNested3;
}

struct DeepNested1 {
    inner: DeepNested2;
}

contract TestContract {
    deep: DeepNested1;

    init() {
        self.deep = DeepNested1{
            inner: DeepNested2{
                inner: DeepNested3{
                    value: 42,
                },
            },
        };
    }
}

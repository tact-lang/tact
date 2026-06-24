struct DeepNested {
    inner: Bool?;
}

struct MiddleNested {
    deep: DeepNested;
    val: Int;
}

contract TestContract {
    data: MiddleNested;

    init() {
        self.data = MiddleNested{
            deep: DeepNested{inner: false},
            val: 42,
        };
    }
}
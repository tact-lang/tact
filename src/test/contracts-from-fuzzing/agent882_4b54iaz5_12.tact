struct BigNested {
    val1: Int;
    val2: Inner?;
}

struct Inner {
    flag: Bool;
    deep: DeepInner?;
}

struct DeepInner {
    message: String;
    num: Int?;
}

contract DeepNesting {
    data: BigNested;

    init() {
        self.data = BigNested{
            val1: 1,
            val2: null
        };
    }
}
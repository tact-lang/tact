struct DeepNested {
    val1: Int;
    val2: Bool?;
    val3: String;
}

struct Middle {
    deep: DeepNested;
    extra: Bool;
}

contract TestContract {
    mid: Middle;

    init() {
        self.mid = Middle{
            deep: DeepNested{
                val1: 1,
                val2: null,
                val3: "abc",
            },
            extra: true,
        };
    }
}
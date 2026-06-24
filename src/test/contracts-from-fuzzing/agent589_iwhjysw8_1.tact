struct NestedOpt {
    val1: Int?;
    val2: String?;
    val3: Another?;
}

struct Another {
    foo: Bool;
    bar: String?;
}

contract DeepOptions {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            val1: null,
            val2: null,
            val3: null,
        };
    }
}

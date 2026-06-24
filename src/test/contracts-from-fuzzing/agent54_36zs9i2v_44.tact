struct DeepOpt {
    o1: Int?;
    o2: Bool?;
}

struct LayerOpt {
    deep: DeepOpt?;
    val: Int;
}

contract OptionalWrapper {
    data: LayerOpt;

    init() {
        self.data = LayerOpt{
            deep: null,
            val: 123
        };
    }
}
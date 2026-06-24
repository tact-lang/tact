struct TopOptOptional {
    level: MidOptional?;
}

struct MidOptional {
    item: DeepOptional?;
}

struct DeepOptional {
    val: Int?;
}

contract MultiLayerNull {
    field: TopOptOptional;

    init() {
        self.field = TopOptOptional{
            level: null
        };
    }
}
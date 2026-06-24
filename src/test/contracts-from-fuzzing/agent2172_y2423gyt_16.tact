struct DeeplyOptional {
    maybe: MidLevel?;
}

struct MidLevel {
    nested: Bottom?;
}

struct Bottom {
    val: Int?;
}

contract DeepOptionals {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{ maybe: null };
    }
}
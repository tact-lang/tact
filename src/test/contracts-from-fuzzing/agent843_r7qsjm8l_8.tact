struct DeepOptional {
    some: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract DeepOptionalContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{ some: InnerOpt{ val: null } };
    }
}
struct DeepOptional {
    sopt: StructOpt?;
}

struct StructOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalsInOptionals {
    field: DeepOptional;

    init() {
        self.field = DeepOptional{ sopt: null };
    }
}
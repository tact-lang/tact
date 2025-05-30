struct DeepOptionalDefault {
    level: OptionalLevel?;
}

struct OptionalLevel {
    field: Bool = true;
}

contract DeepOptDef {
    val: DeepOptionalDefault;

    init() {
        self.val = DeepOptionalDefault{
            level: OptionalLevel {}
        };
    }
}

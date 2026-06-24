struct DeepOptional {
    field: OptionalLevel1?;
}

struct OptionalLevel1 {
    level2: OptionalLevel2?;
}

struct OptionalLevel2 {
    value: Int?;
}

contract DeepOptionTest {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{ field: null };
    }
}
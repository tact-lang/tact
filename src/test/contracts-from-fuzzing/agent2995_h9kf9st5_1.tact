struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract DeepOptionalContract {
    field: DeepOptional;

    init() {
        self.field = DeepOptional{
            x: null,
            y: true,
            z: "hello"
        };
    }
}
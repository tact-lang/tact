struct DeepOption {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFields {
    val: DeepOption;
    init() {
        self.val = DeepOption{
            x: null,
            y: true,
            z: null,
        };
    }
}
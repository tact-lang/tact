struct OptionalStructNestedOption {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructOptional {
    s: OptionalStructNestedOption?;

    init() {
        self.s = OptionalStructNestedOption{
            x: null,
            y: true,
            z: null,
        };
    }
}
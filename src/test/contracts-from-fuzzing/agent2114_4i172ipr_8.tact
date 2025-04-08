struct ComplexOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFields {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            x: null,
            y: true,
            z: null,
        };
    }
}

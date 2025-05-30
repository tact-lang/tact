struct OptionalContainer {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OnlyOptionalFields {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            x: null,
            y: null,
            z: null
        };
    }
}
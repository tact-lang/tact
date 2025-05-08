struct OptionalPrimitives {
    x: Int?;
    y: Bool?;
    z: Address?;
    s: String?;
}

contract OptionalsStorage {
    data: OptionalPrimitives;
    init() {
        self.data = OptionalPrimitives{
            x: null,
            y: null,
            z: null,
            s: null,
        };
    }
}
struct OptionalPrimitives {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract TestContract {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            x: null,
            y: true,
            z: null
        };
    }
}
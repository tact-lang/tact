struct OptionalDeep {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract TestContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            x: null,
            y: null,
            z: null,
        };
    }
}
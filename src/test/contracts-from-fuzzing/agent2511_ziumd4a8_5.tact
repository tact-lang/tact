struct OptionalMix {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStore {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            x: null,
            y: true,
            z: null
        };
    }
}
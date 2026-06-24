struct OptionalMix {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;
    key: Int;
}

contract TestContract {
    data: OptionalMix;
    init() {
        self.data = OptionalMix{
            x: null,
            y: true,
            z: null,
            addr: null,
            key: 777
        };
    }
}
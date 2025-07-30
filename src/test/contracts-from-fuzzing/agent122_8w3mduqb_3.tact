struct SimpleOptAddress {
    x: Int;
    y: Bool?;
    z: Address?;
}

contract DeepOpt {
    s: SimpleOptAddress = SimpleOptAddress{
        x: 1,
        y: null,
        z: null,
    };
    init() {
        self.s = SimpleOptAddress{
            x: 42,
            y: true,
            z: null,
        };
    }
}

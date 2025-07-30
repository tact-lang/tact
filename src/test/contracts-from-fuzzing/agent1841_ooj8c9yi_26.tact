struct VariantZero {
    x: Int as int8;
    y: Int as uint8;
    z: Int as int257;
}

contract VariantSerde {
    s: VariantZero;

    init() {
        self.s = VariantZero{
            x: -10,
            y: 250,
            z: 1000000000000000
        };
    }
}

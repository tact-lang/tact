struct Complex {
    big: Int as int128;
    small: Int as uint8;
    nano: Int as coins;
    maybe: Bool?;
}

contract ComplexHolder {
    field: Complex;

    init() {
        self.field = Complex{
            big: -1000000,
            small: 255,
            nano: ton("5"),
            maybe: null
        };
    }
}
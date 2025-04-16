struct Mixed {
    a: Int as uint8;
    b: Int? as uint16;
    c: Bool = true;
    d: String?;
    e: Int = -7;
}

contract TestContract {
    mixed: Mixed;

    init() {
        self.mixed = Mixed{
            a: 5,
            b: null,
            // omit `c` and `e` = use defaults
            d: "nullable string"
        };
    }
}
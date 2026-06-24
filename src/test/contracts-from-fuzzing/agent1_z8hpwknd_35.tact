struct SOption {
    x: Int?;
}

contract FieldWithDefaultStructOpt {
    s: SOption = SOption{ x: null };

    init() {
        self.s = SOption{ x: null };
    }
}
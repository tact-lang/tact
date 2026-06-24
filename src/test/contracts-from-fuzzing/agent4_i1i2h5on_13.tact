struct OptionalSerial {
    val: Int?;
}

contract TestContract {
    opt1: OptionalSerial;
    opt2: OptionalSerial;

    init() {
        self.opt1 = OptionalSerial{ val: null };
        self.opt2 = OptionalSerial{ val: 100 };
    }
}

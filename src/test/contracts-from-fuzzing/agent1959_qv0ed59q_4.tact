struct BoolStruct {
    on: Bool;
    off: Bool;
    maybe: Bool?;
}

contract BoolStructContract {
    bits: BoolStruct;

    init() {
        self.bits = BoolStruct{
            on: true,
            off: false,
            maybe: null,
        };
    }
}
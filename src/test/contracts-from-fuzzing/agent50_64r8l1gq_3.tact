struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    addr: Address?;
    slice: Slice?;
}

contract OptionalStructContract {
    dat: OptionalStruct;

    init() {
        self.dat = OptionalStruct{ foo: null, bar: null, addr: null, slice: null };
    }
}
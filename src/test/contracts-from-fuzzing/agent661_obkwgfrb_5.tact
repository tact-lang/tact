struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionContract {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            a: null,
            b: true,
            c: null
        };
    }
}
struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
}

contract TestContract {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            a: null,
            b: true,
            c: null,
            d: myAddress(),
        };
    }
}
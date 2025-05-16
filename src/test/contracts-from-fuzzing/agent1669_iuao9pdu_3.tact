struct OptionalStruct {
    s: String?;
    n: Int?;
    b: Bool?;
    addr: Address?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            s: null,
            n: null,
            b: null,
            addr: null
        };
    }
}

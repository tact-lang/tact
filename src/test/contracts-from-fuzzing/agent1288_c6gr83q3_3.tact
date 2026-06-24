struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}

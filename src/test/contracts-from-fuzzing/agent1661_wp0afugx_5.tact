struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptStructTest {
    optionalData: OptStruct;

    init() {
        self.optionalData = OptStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
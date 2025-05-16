struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalFieldsTest {
    data: OptionalNest;
    
    init() {
        self.data = OptionalNest{
            a: null,
            b: true,
            c: null,
            d: myAddress()
        };
    }
}
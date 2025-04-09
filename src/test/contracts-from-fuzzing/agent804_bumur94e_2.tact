struct OptionalsTest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    data: OptionalsTest;
    
    init() {
        self.data = OptionalsTest{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}

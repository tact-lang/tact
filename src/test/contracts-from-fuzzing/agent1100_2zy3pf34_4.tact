struct ComplexOptional {
    flag: Bool = false;
    number: Int?;
    addr: Address?;
}

contract OptStructTest {
    co: ComplexOptional;

    init() {
        self.co = ComplexOptional{
            flag: true,
            number: null,
            addr: null
        };
    }
}

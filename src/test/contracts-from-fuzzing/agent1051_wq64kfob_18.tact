struct OptAddrStrB {
    addr: Address?;
    str: String?;
    b: Bool?;
}

contract OptComboTest {
    data: OptAddrStrB;

    init() {
        self.data = OptAddrStrB{
            addr: null,
            str: null,
            b: null
        };
    }
}
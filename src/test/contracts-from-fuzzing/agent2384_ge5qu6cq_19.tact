struct OptionalAddrStr {
    addr: Address?;
    str: String?;
}

contract OptAddrStrTest {
    data: OptionalAddrStr;

    init() {
        self.data = OptionalAddrStr{
            addr: null,
            str: null,
        };
    }
}
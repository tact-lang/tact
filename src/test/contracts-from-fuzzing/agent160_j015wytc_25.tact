struct OptAddrStr {
    a: Address?;
    b: String?;
}

contract OptAddrStrTest {
    f: OptAddrStr;
    init() {
        self.f = OptAddrStr{
            a: null,
            b: "hello"
        };
    }
}
struct OptAddrStr {
    a: Address?;
    s: String?;
}

contract TestContract {
    oas: OptAddrStr;

    init() {
        self.oas = OptAddrStr {
            a: null,
            s: null
        };
    }
}
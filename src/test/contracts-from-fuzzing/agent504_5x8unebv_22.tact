struct OptAddrStr {
    a: Address?;
    s: String?;
}

contract OptAddrStrField {
    data: OptAddrStr;

    init() {
        self.data = OptAddrStr{
            a: null,
            s: null,
        };
    }

    receive() {
        let d = self.data;
    }
}
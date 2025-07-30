struct AddrStr {
    a: Address;
    s: String;
}

contract TestContract {
    data: AddrStr;

    init() {
        self.data = AddrStr{
            a: myAddress(),
            s: "abc"
        };
    }
}
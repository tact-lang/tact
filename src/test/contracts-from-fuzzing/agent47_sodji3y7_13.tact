struct AddrString {
    sa: String;
    oa: String?;
    sb: Address;
    ob: Address?;
}

contract TestContract {
    data: AddrString;

    init() {
        self.data = AddrString{
            sa: "hello",
            oa: null,
            sb: myAddress(),
            ob: null,
        };
    }
}
struct AddrString {
    ad1: Address;
    str1: String;
    ad2: Address;
    str2: String;
}

contract TestContract {
    asStruct: AddrString;

    init() {
        self.asStruct = AddrString{
            ad1: myAddress(),
            str1: "foo",
            ad2: myAddress(),
            str2: "bar"
        };
    }
}
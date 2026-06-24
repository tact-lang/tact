struct StringAddress {
    s: String;
    a: Address;
}

contract TestContract {
    sa: StringAddress;

    init() {
        self.sa = StringAddress{
            s: "hi",
            a: myAddress()
        };
    }
}
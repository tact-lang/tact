struct StrAddress {
    s: String;
    a: Address;
}

contract ComposeStruct {
    val: StrAddress;

    init() {
        self.val = StrAddress{ s:"test", a:myAddress() };
    }
}
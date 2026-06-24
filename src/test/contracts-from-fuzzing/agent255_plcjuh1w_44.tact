struct HasAddrBool {
    a: Address;
    b: Bool;
}

contract AddrBoolTest {
    data: HasAddrBool;

    init() {
        self.data = HasAddrBool{ a: myAddress(), b: true };
    }
}
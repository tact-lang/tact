contract AddrBoolTest {
    addr: Address;
    flag: Bool = true;

    init() {
        self.addr = myAddress();
    }
}
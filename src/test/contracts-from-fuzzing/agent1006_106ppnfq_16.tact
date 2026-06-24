struct WithAddress {
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

contract TestContract {
    wa: WithAddress;

    init() {
        let a = myAddress();
        self.wa = WithAddress{ addr1:a, addr2:a, addr3:a };
    }
}

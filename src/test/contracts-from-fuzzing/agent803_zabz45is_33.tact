struct ContainContractAddr {
    a: Address;
}

contract ContractAddressTest {
    field: ContainContractAddr;
    init() {
        self.field = ContainContractAddr{
            a: myAddress()
        };
    }
}
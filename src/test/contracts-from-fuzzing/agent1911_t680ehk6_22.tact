struct ContractRefHolder {
    target: Address;
    flag: Bool;
    comment: String;
}

contract RefAddressStore {
    values: ContractRefHolder;

    init() {
        self.values = ContractRefHolder{
            target: myAddress(),
            flag: false,
            comment: "ref"
        };
    }
}
struct ContractLikeStruct {
    amount: Int;
    sender: Address;
    comment: String;
}

contract StructInStructTest {
    payment: ContractLikeStruct;

    init() {
        self.payment = ContractLikeStruct{
            amount: 100,
            sender: myAddress(),
            comment: "init"
        };
    }

    receive() {
        self.payment = ContractLikeStruct{
            amount: 200,
            sender: myAddress(),
            comment: "updated"
        };
    }
}
struct Composite {
    flag: Bool;
    message: String;
    amount: Int;
    account: Address;
}

contract Holder {
    data: Composite;
    init(){
        self.data = Composite{
            flag: true,
            message: "Hello",
            amount: 100,
            account: myAddress()
        };
    }
}
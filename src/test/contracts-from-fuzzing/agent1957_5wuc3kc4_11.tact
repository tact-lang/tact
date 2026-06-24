struct MessageData {
    flag: Bool;
    text: String;
    amount: Int;
    optionalText: String?;
    optionalAmount: Int?;
}

contract VariousTypes {
    val: MessageData;

    init() {
        self.val = MessageData{
            flag: true,
            text: "Hello",
            amount: 100,
            optionalText: null,
            optionalAmount: null
        };
    }
}
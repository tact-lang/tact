struct MessageData {
    text: String;
    flag: Bool;
    number: Int;
}

contract LargeBasicTypes {
    s: MessageData;

    init() {
        self.s = MessageData{ text:"abc", flag:true, number:123 };
    }
}
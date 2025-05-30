struct MessageStruct {
    a: Int;
}

contract MessageStructField {
    data: MessageStruct;
    init() {
        self.data = MessageStruct{a: 1};
    }
}
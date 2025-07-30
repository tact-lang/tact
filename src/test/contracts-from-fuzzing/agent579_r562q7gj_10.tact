message(0xABCDEF01) MsgData {
    val: Int;
    text: String;
    flag: Bool?;
}

contract MsgStructStorage {
    stored: MsgData;

    init() {
        self.stored = MsgData{
            val: 123,
            text: "hi",
            flag: null
        };
    }
}
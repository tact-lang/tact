message(100) SubMsg {
    val: Int;
}

struct Holder {
    m: SubMsg;
    text: String;
}

contract MessageFieldStorage {
    info: Holder;

    init() {
        self.info = Holder{
            m: SubMsg{ val: 5 },
            text: "Test",
        };
    }
}
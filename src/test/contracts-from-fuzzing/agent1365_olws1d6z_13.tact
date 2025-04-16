struct MessageData {
    num: Int;
    txt: String;
}

contract OptionalStorage {
    data: MessageData?;

    init() {
        self.data = null;
    }
}
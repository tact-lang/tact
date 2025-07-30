struct Msg {
    text: String;
}

contract StorageWithMessage {
    some: Msg;

    init() {
        self.some = Msg{ text: "hi" };
    }
}

message(12345) OptMsg {
    id: Int?;
    name: String?;
    flag: Bool?;
}

contract TestContract {
    stored: OptMsg;

    init() {
        self.stored = OptMsg{
            id: 99,
            name: "hello",
            flag: null
        };
    }
}
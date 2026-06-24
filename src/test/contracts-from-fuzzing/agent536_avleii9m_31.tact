message(42) DataMsg {
    content: Int;
}

contract StoreMsg {
    m: DataMsg = DataMsg{content:0};

    init() {
        self.m = DataMsg{content:1};
    }
}
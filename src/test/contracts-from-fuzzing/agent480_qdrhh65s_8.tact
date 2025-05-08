struct Item {
    ival: Int;
}

message(0x42) DataMsg {
    s: String;
    inner: Item;
}

contract MessageField {
    data: DataMsg; 

    init() {
        self.data = DataMsg{s:"msg", inner: Item{ival:99}};
    }
}
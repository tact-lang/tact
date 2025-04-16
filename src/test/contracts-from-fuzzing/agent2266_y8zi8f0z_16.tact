struct Info {
    id: Int as uint32;
    amount: Int as coins;
    note: String?;
}

contract Test {
    info: Info;

    init() {
        self.info = Info{id: 12345, amount: ton("1.5"), note: null};
    }
}

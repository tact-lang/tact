struct Bag {
    note: String;
    flag: Bool;
}

contract ManyTypesFields {
    count: Int;
    active: Bool;
    text: String;
    data: Cell;
    info: Bag;

    init() {
        self.count = 99;
        self.active = true;
        self.text = "hello";
        self.data = emptyCell();
        self.info = Bag{ note: "bag", flag: false };
    }
}

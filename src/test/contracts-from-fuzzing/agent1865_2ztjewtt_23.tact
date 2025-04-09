struct Item {
    name: String;
    value: Int?;
}

contract ListWrap {
    first: Item;
    second: Item;

    init() {
        self.first = Item{ name: "First", value:null };
        self.second = Item{ name: "Second", value:null };
    }
}
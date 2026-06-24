struct Item {
    a: Int;
    b: Bool?;
}

contract Test {
    first: Item;
    second: Item;

    init() {
        self.first = Item{ a: 10, b: null };
        self.second = Item{ a: -5, b: true };
    }
}
struct Item {
    id: Int as uint32;
    enabled: Bool;
}

contract TestContract {
    a: Item;
    b: Item;
    c: Item;

    init() {
        self.a = Item{ id: 1, enabled: true };
        self.b = Item{ id: 2, enabled: false };
        self.c = Item{ id: 3, enabled: true };
    }
}

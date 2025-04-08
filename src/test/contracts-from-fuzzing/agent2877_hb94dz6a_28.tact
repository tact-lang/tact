struct Item {
    id: Int;
    active: Bool;
}

struct Container {
    item1: Item;
    item2: Item;
    flag: Bool;
}

contract Combine {
    data: Container;

    init() {
        self.data = Container{
            item1: Item{ id: 1, active: true },
            item2: Item{ id: 2, active: false },
            flag: true
        };
    }
}
struct Item {
    id: Int;
    active: Bool;
    label: String;
}

// Slightly large array of fields contract, pushing serialization limits
contract TestContract {
    f1: Item;
    f2: Item;
    f3: Item;
    f4: Item;
    f5: Item;

    init() {
        self.f1 = Item{id:1, active:true, label:"a"};
        self.f2 = Item{id:2, active:false, label:"b"};
        self.f3 = Item{id:3, active:true, label:"c"};
        self.f4 = Item{id:4, active:true, label:"d"};
        self.f5 = Item{id:5, active:false, label:"e"};
    }
}
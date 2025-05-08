struct Item {
    tag: String;
    val: Int;
}

struct Collection {
    i1: Item;
    i2: Item;
    i3: Item;
}

contract RepeatedStructs {
    coll: Collection;
    init() {
        self.coll = Collection{
            i1: Item{ tag:"a", val:1 },
            i2: Item{ tag:"b", val:2 },
            i3: Item{ tag:"c", val:3 },
        };
    }
}
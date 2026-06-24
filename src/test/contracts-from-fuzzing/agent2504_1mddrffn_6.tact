struct CollectionA {
    a1: Int;
    a2: Bool;
    a3: String?;
}

struct CollectionB {
    b1: Int;
    b2: Address;
    b3: CollectionA;
}

contract MultiStructContract {
    item1: CollectionA;
    item2: CollectionB;

    init() {
        self.item1 = CollectionA{a1: 1, a2: true, a3: null};
        self.item2 = CollectionB{b1: 2, b2: myAddress(), b3: self.item1};
    }
}

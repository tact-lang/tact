struct ArrayItem {
    val: Int;
}

struct ArrayLike {
    item1: ArrayItem;
    item2: ArrayItem;
    item3: ArrayItem;
    item4: ArrayItem;
    item5: ArrayItem;
}

contract TestContract {
    storageArray: ArrayLike;

    init() {
        self.storageArray = ArrayLike{
            item1: ArrayItem{val:1},
            item2: ArrayItem{val:2},
            item3: ArrayItem{val:3},
            item4: ArrayItem{val:4},
            item5: ArrayItem{val:5}
        };
    }
}

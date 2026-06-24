struct ArrayLike {
    item0: Int;
    item1: Int;
    item2: Int;
    item3: Int;
    item4: Int;
    item5: Int;
    item6: Int;
    item7: Int;
    item8: Int;
    item9: Int;
}

contract ManyFields {
    storage: ArrayLike;

    init() {
        self.storage = ArrayLike{
            item0: 0, item1:1, item2:2, item3:3, item4:4,
            item5:5, item6:6, item7:7, item8:8, item9:9
        };
    }
}
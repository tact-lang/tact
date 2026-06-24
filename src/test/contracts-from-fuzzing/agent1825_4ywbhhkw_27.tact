struct HasInt {
    val: Int;
}

contract ListOfStructs {
    item1: HasInt;
    item2: HasInt;
    item3: HasInt;

    init() {
        self.item1 = HasInt{val:1};
        self.item2 = HasInt{val:2};
        self.item3 = HasInt{val:3};
    }
}

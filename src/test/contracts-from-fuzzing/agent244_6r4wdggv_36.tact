struct OnlyOne {
    val: Int;
}

contract SmallestStruct {
    item: OnlyOne;

    init() {
        self.item = OnlyOne{ val: 1 };
    }
}
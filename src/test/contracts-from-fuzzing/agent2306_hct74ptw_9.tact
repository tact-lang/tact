struct InnerStr {
    x: Int;
}

contract PersistArray {
    arr0: InnerStr;
    arr1: InnerStr;
    arr2: InnerStr;

    init() {
        self.arr0 = InnerStr{ x: 0 };
        self.arr1 = InnerStr{ x: 1 };
        self.arr2 = InnerStr{ x: 2 };
    }
}

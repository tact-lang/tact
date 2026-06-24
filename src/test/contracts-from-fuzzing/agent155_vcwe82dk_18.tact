struct InnerStr {
    x: Int = 42;
    y: Bool = false;
}

contract TestContract {
    arr0: Int = 0;
    arr1: Int = 1;
    arr2: Int = 2;
    arr3: Int = 3;
    arr4: Int = 4;
    nested1: InnerStr = InnerStr{};
    nested2: InnerStr = InnerStr{};
    nested3: InnerStr = InnerStr{};

    init() {
        self.arr0 = 0;
        self.arr1 = 1;
        self.arr2 = 2;
        self.arr3 = 3;
        self.arr4 = 4;
        self.nested1 = InnerStr{};
        self.nested2 = InnerStr{};
        self.nested3 = InnerStr{};
    }
}
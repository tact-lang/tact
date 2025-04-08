struct Basic {
    val: Int;
}

contract Test {
    arr1: Basic;
    arr2: Basic;
    arr3: Basic;
    arr4: Basic;
    init() {
        self.arr1 = Basic{val:1};
        self.arr2 = Basic{val:2};
        self.arr3 = Basic{val:3};
        self.arr4 = Basic{val:4};
    }
}
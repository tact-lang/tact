struct Inner { val: Int; }

contract TestContract {
    arr0: Inner;
    arr1: Inner;
    arr2: Inner;
    arr3: Inner;
    arr4: Inner;

    init() {
        self.arr0 = Inner{ val: 0 };
        self.arr1 = Inner{ val: 1 };
        self.arr2 = Inner{ val: 2 };
        self.arr3 = Inner{ val: 3 };
        self.arr4 = Inner{ val: 4 };
    }
}
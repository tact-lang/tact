struct Inner {
    number: Int;
    flag: Bool;
}

contract TestContract {
    arr0: Inner;
    arr1: Inner;
    arr2: Inner;
    arr3: Inner;
    arr4: Inner;

    init() {
        self.arr0 = Inner{ number: 0, flag: false };
        self.arr1 = Inner{ number: 1, flag: true };
        self.arr2 = Inner{ number: 2, flag: false };
        self.arr3 = Inner{ number: 3, flag: true };
        self.arr4 = Inner{ number: 4, flag: false };
    }

    receive() {
        self.arr0 = Inner{ number: 10, flag: true };
        self.arr1 = Inner{ number: 11, flag: false };
        self.arr2 = Inner{ number: 12, flag: true };
        self.arr3 = Inner{ number: 13, flag: false };
        self.arr4 = Inner{ number: 14, flag: true };
    }
}
struct Inner {
    num: Int;
    flag: Bool;
}

contract TestContract {
    arr0: Inner;
    arr1: Inner;
    arr2: Inner;
    arr3: Inner;
    arr4: Inner;
    init() {
        self.arr0 = Inner{num:0, flag:true};
        self.arr1 = Inner{num:1, flag:false};
        self.arr2 = Inner{num:2, flag:true};
        self.arr3 = Inner{num:3, flag:false};
        self.arr4 = Inner{num:4, flag:true};
    }
}
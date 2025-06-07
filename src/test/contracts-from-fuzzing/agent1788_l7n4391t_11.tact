struct S {
    a: Int;
}

contract TestContract {
    arr0: S;
    arr1: S;
    arr2: S;
    arr3: S;
    arr4: S;
    arr5: S;
    arr6: S;
    arr7: S;
    arr8: S;
    arr9: S;
    init() {
        self.arr0 = S{a:0};
        self.arr1 = S{a:1};
        self.arr2 = S{a:2};
        self.arr3 = S{a:3};
        self.arr4 = S{a:4};
        self.arr5 = S{a:5};
        self.arr6 = S{a:6};
        self.arr7 = S{a:7};
        self.arr8 = S{a:8};
        self.arr9 = S{a:9};
    }
}
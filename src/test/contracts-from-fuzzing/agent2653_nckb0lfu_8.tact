struct X { val: Int }

contract TestContract {
    arr0: X;
    arr1: X;
    arr2: X;
    arr3: X;
    arr4: X;
    arr5: X;
    arr6: X;
    arr7: X;
    arr8: X;
    arr9: X;

    init() {
        self.arr0 = X{val:0};
        self.arr1 = X{val:1};
        self.arr2 = X{val:2};
        self.arr3 = X{val:3};
        self.arr4 = X{val:4};
        self.arr5 = X{val:5};
        self.arr6 = X{val:6};
        self.arr7 = X{val:7};
        self.arr8 = X{val:8};
        self.arr9 = X{val:9};
    }
}
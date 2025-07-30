struct S {
    a: Int;
    b: Int;
}

contract TestContract {
    arr0: S;
    arr1: S;
    arr2: S;
    arr3: S;
    arr4: S;

    init() {
        self.arr0 = S{a:0,b:0};
        self.arr1 = S{a:1,b:1};
        self.arr2 = S{a:2,b:2};
        self.arr3 = S{a:3,b:3};
        self.arr4 = S{a:4,b:4};
    }
}
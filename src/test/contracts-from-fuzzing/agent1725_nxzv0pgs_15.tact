struct S {
    a: Int;
    b: String?;
}

contract TestContract {
    arr0: S;
    arr1: S;
    arr2: S;
    arr3: S;
    arr4: S;

    init() {
        self.arr0 = S{a:0,b:null};
        self.arr1 = S{a:1,b:"q"};
        self.arr2 = S{a:2,b:null};
        self.arr3 = S{a:3,b:"w"};
        self.arr4 = S{a:4,b:null};
    }
}
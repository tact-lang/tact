struct S {
    a: Int;
    b: Bool;
}

contract TestContract {
    arr1: S;
    arr2: S;
    arr3: S;
    arr4: S;
    arr5: S;

    init() {
        self.arr1 = S{a:1,b:true};
        self.arr2 = S{a:2,b:false};
        self.arr3 = S{a:3,b:true};
        self.arr4 = S{a:4,b:false};
        self.arr5 = S{a:5,b:true};
    }
}
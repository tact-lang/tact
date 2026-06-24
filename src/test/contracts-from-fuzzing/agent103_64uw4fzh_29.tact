struct S {
    a: Int;
    b:  Bool?;
}

contract TestContract {
    arr1: S;
    arr2: S;

    init() {
        self.arr1 = S{a:1,b:true};
        self.arr2 = S{a:2,b:null};
    }
}

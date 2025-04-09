struct S {
    x: Int; y: Bool; z: String; o: Int?;
}

contract TestContract {
    arr0: S;
    arr1: S;
    arr2: S;
    arr3: S;

    init() {
        self.arr0 = S{x:0,y:true,z:"zero",o:null};
        self.arr1 = S{x:1,y:false,z:"one",o:1};
        self.arr2 = S{x:2,y:true,z:"two",o:null};
        self.arr3 = S{x:3,y:false,z:"three",o:3};
    }
}

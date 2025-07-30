struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    arr1: S;
    arr2: S;
    arr3: S;
    arr4: S;
    arr5: S;
    arr6: S;
    arr7: S;
    arr8: S;
    arr9: S;
    arr10: S;

    init() {
        self.arr1 = S{a:1,b:true,c:"a"};
        self.arr2 = S{a:2,b:false,c:"b"};
        self.arr3 = S{a:3,b:true,c:"c"};
        self.arr4 = S{a:4,b:false,c:"d"};
        self.arr5 = S{a:5,b:true,c:"e"};
        self.arr6 = S{a:6,b:false,c:"f"};
        self.arr7 = S{a:7,b:true,c:"g"};
        self.arr8 = S{a:8,b:false,c:"h"};
        self.arr9 = S{a:9,b:true,c:"i"};
        self.arr10 = S{a:10,b:false,c:"j"};
    }
}
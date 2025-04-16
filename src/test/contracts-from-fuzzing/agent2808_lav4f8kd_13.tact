struct S {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract Test {
    arr0: S; arr1: S; arr2: S; arr3: S; arr4: S;
    init() {
        self.arr0 = S{ val1:1, val2:true, val3:"a" };
        self.arr1 = S{ val1:2, val2:false, val3:"b" };
        self.arr2 = S{ val1:3, val2:true, val3:"c" };
        self.arr3 = S{ val1:4, val2:false, val3:"d" };
        self.arr4 = S{ val1:5, val2:true, val3:"e" };
    }
}
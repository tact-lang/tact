struct S {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String?;
}

contract Fuzz16 {
    arr: S;

    init() {
        self.arr = S{ f1:1, f2:true, f3:null, f4:false, f5:"ok" };
    }
}
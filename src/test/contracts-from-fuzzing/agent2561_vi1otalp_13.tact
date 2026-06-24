struct S {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
}

contract MultiStructs {
    s1: S;
    s2: S;
    s3: S;
    s4: S;

    init() {
        let s_tmp = S{f1:1,f2:true,f3:"hi",f4:myAddress(),f5:emptyCell(),f6:emptyCell().asSlice()};
        self.s1 = s_tmp;
        self.s2 = s_tmp;
        self.s3 = s_tmp;
        self.s4 = s_tmp;
    }
}
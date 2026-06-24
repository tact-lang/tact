struct S {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Int;
    f5: Bool;
    f6: String;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            f1:null, f2:true, f3:null,
            f4:4, f5:false, f6:"str"
        };
    }
}
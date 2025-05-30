struct ABool {
    a: Bool;
}
struct BInt {
    b: Int;
}
struct CString {
    c: String;
}

contract MultiStructs {
    af: ABool;
    bf: BInt;
    cf: CString;

    init() {
        self.af = ABool{ a:true };
        self.bf = BInt{ b:5 };
        self.cf = CString{ c:"ok" };
    }
}
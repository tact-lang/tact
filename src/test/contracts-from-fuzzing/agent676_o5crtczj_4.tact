struct L {
    f0: Int;
    f1: Bool;
    f2: String;
    f3: Bool?;
    f4: Int?;
    f5: String;
    f6: Bool;
    f7: Int;
    f8: String;
    f9: Bool?;
}

contract TestContract {
    val: L;

    init() {
        self.val = L{
            f0:10, f1:true, f2:"a", f3:null, f4:null, f5:"b", f6:false, f7:20, f8:"c", f9:true
        };
    }
}
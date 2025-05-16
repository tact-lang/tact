struct Big {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Int;
    f8: String;
    f9: Bool;
}

contract HasBig {
    b: Big;

    init() {
        self.b = Big{f1:1, f2:"2", f3:true, f4:4, f5:false, f6:"6", f7:7, f8:"8", f9:true};
    }
}
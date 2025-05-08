struct LargeDefaultsAndOpts {
    f1:Int=1; f2:Int=2; f3:Int?=null; f4:Int=4; f5:Int?=null;
    f6:Int=6; f7:Int?=null; f8:Int=8; f9:Int?=null; f10:Int=10;
}

contract TestContract {
    big: LargeDefaultsAndOpts;

    init() {
        self.big = LargeDefaultsAndOpts{
            f1:11,f2:12,f3:13,f4:14,f5:null,
            f6:16,f7:17,f8:18,f9:null,f10:20
        };
    }
}
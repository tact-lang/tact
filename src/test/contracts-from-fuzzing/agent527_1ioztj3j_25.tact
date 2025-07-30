struct Flags {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
    f8: Bool;
}

struct Numbers {
    n1: Int;
    n2: Int;
    n3: Int;
    n4: Int;
}

contract MixedFields {
    flags: Flags;
    nums: Numbers;
    init() {
        self.flags = Flags{
            f1:true,f2:true,f3:false,f4:false,f5:true,f6:false,f7:true,f8:true
        };
        self.nums = Numbers{
            n1:1,n2:2,n3:3,n4:4
        };
    }
}
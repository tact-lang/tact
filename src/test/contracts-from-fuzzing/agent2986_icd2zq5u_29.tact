// struct with many bool fields to test space efficiency
struct Bools {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
}

contract ManyBools {
    bs: Bools;

    init() {
        self.bs = Bools{
            f1:true,f2:false,f3:true,f4:true,f5:false,
            f6:true,f7:false,f8:true,f9:false,f10:true
        };
    }
}
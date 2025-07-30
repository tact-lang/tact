struct MultiBool {
    x1: Bool;
    x2: Bool;
    x3: Bool;
    x4: Bool;
    x5: Bool;
    x6: Bool;
    x7: Bool;
    x8: Bool;
}

contract TestContract {
    flags: MultiBool;

    init() {
        self.flags = MultiBool{
            x1:true,x2:false,x3:true,x4:true,
            x5:false,x6:true,x7:false,x8:true
        };
    }
}
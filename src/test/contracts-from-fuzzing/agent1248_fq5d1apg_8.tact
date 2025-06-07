struct DeepOpts {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
    f6: Bool?;
    f7: Bool?;
    f8: Bool?;
    f9: Bool?;
    f10: Bool?;
}

contract ManyOptions {
    opts: DeepOpts;

    init() {
        self.opts = DeepOpts{
            f1:true,f2:null,f3:true,f4:null,f5:true,
            f6:null,f7:true,f8:null,f9:true,f10:null
        };
    }
}

struct ManyOpts {
    o1:Int?;o2:Int?;o3:Int?;o4:Int?;o5:Int?;
    o6:Int?;o7:Int?;o8:Int?;o9:Int?;o10:Int?;
    o11:Int?;o12:Int?;o13:Int?;o14:Int?;o15:Int?;
    o16:Int?;o17:Int?;o18:Int?;o19:Int?;o20:Int?;
}

contract ManyOptionals {
    opts:ManyOpts;

    init() {
        self.opts = ManyOpts{
            o1:null,o2:null,o3:null,o4:null,o5:null,
            o6:null,o7:null,o8:null,o9:null,o10:null,
            o11:null,o12:null,o13:null,o14:null,o15:null,
            o16:null,o17:null,o18:null,o19:null,o20:null
        };
    }
}
struct ManyOptionals {
    opt1: Int?;
    opt2: Int?;
    opt3: Int?;
    opt4: Int?;
    opt5: Int?;
    opt6: Int?;
    opt7: Int?;
    opt8: Int?;
    opt9: Int?;
    opt10: Int?;
}

contract TestContract {
    data: ManyOptionals = ManyOptionals{
        opt1:null, opt2:null, opt3:null, opt4:null, opt5:null,
        opt6:null,opt7:null,opt8:null,opt9:null,opt10:null
    };

    init() {
        self.data = ManyOptionals{
            opt1:1,opt2:2,opt3:3,opt4:4,opt5:5,
            opt6:6,opt7:7,opt8:8,opt9:9,opt10:10
        };
    }
}

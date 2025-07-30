struct ManyOptional {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
    f6: Int?;
    f7: Int?;
    f8: Int?;
    f9: Int?;
    f10: Int?;
}

contract TestContract {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            f1:null,f2:null,f3:null,f4:null,f5:null,
            f6:null,f7:null,f8:null,f9:null,f10:null
        };
    }
}
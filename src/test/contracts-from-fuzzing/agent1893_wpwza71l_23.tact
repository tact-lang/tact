struct BigOptional {
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
    x5: Int?;
    x6: Int?;
    x7: Int?;
    x8: Int?;
    x9: Int?;
    x10: Int?;
}

contract ManyOptionals {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            x1:null,x2:null,x3:null,x4:null,x5:null,
            x6:null,x7:null,x8:null,x9:null,x10:null
        };
    }
}
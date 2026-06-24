struct ManyOptional {
    i1: Int?;
    i2: Int?;
    i3: Int?;
    i4: Int?;
    i5: Int?;
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
}

contract OptionalHeavy {
    opt: ManyOptional;
    init() {
        self.opt = ManyOptional{
            i1:null,i2:2,i3:null,i4:4,i5:null,b1:true,b2:null,b3:false,b4:null
        };
    }
}
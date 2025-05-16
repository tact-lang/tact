struct ManyOptional {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int?;
    f8: Bool?;
}

contract ManyOptFields {
    nested: ManyOptional;

    init() {
        self.nested = ManyOptional{
            f1:null, f2:true, f3:null, f4:4, f5:false, f6:"hi", f7:null, f8:null
        };
    }
}
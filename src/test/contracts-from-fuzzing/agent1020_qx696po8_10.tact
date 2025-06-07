struct ManyOptional {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Int?;
}

contract ManyOptionalTest {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            f1:null,f2:null,f3:null,f4:null,f5:null,f6:null,f7:null,f8:null,f9:null,f10:null
        };
    }
}
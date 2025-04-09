struct ManyFlatFields {
    f1: Int;
    f2: Int;
    f3: String;
    f4: String;
    f5: Bool;
    f6: Bool;
    f7: Int?;
    f8: String?;
    f9: Bool?;
}

contract ManyFlatFieldsTest {
    data: ManyFlatFields;

    init() {
        self.data = ManyFlatFields{
            f1:1,f2:2,f3:"a",f4:"b",f5:true,f6:false,f7:null,f8:null,f9:null
        };
    }
}
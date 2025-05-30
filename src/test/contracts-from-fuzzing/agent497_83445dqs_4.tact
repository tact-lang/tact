struct TenFields {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Int?;
    a5: Bool?;
    a6: String;
    a7: Int;
    a8: Bool;
    a9: String;
    a10: Int;
}

contract ManyFieldsContract {
    data: TenFields;

    init() {
        self.data = TenFields{
            a1:1,a2:true,a3:"a",a4:null,a5:null,a6:"b",a7:7,a8:false,a9:"c",a10:10
        };
    }
}
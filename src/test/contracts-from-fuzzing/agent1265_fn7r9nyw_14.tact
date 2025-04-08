struct WideStruct {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Bool?;
}

contract WideFields {
    payload: WideStruct;

    init() {
        self.payload = WideStruct{
            f1:1,f2:"",f3:true,f4:null,f5:null,f6:null,
            f7:2,f8:false,f9:"text",f10:null
        };
    }
}
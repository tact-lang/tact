struct Payload {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract ComboFields {
    data: Payload;

    init() {
        self.data = Payload{
            intVal:1,strVal:"x",boolVal:true,
            optInt:null,optStr:null,optBool:null
        };
    }
}
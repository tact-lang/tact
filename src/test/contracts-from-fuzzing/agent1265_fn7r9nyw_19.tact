struct Mixed {
    intVal: Int;
    optVal: Int?;
    boolVal: Bool;
    optBool: Bool?;
    strVal: String;
    optStr: String?;
}

contract MixFields {
    content: Mixed;

    init() {
        self.content = Mixed{
            intVal:1,
            optVal:null,
            boolVal:true,
            optBool:null,
            strVal:"",
            optStr:null
        };
    }
}
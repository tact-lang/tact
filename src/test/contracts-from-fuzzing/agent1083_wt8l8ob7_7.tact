struct InnerData {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

struct OuterData {
    d1: InnerData;
    d2: InnerData;
}

contract MultiDeep {
    store: OuterData;

    init() {
        self.store = OuterData{
            d1: InnerData{intVal:1,boolVal:true,strVal:"a",optInt:null,optBool:null,optStr:null},
            d2: InnerData{intVal:2,boolVal:false,strVal:"b",optInt:null,optBool:null,optStr:null}
        };
    }
}
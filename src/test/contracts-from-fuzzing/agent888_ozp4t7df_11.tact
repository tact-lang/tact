struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract NestedMix {
    a: Mix;
    b: Mix;
    c: Mix;

    init() {
        self.a = Mix{intVal:1,boolVal:true,strVal:"a",optInt:null,optBool:null,optStr:null};
        self.b = Mix{intVal:2,boolVal:false,strVal:"b",optInt:null,optBool:true,optStr:null};
        self.c = Mix{intVal:3,boolVal:true,strVal:"c",optInt:10,optBool:null,optStr:"x"};
    }
}
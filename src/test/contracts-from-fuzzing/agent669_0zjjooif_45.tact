contract Volatile {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;

    init() {
        self.intVal=123;
        self.boolVal=true;
        self.strVal="zzz";
        self.intOpt=null;
        self.boolOpt=null;
        self.strOpt=null;
    }
}
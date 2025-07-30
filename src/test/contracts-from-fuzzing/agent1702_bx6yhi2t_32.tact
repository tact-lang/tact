struct Mixed {
    intVal: Int;
    boolVal: Bool;
    optStr: String?;
    intOpt: Int?;
}

contract CombinedOptionals {
    m: Mixed;

    init() {
        self.m = Mixed{
            intVal:1,
            boolVal:false,
            optStr:null,
            intOpt:5
        };
    }
}

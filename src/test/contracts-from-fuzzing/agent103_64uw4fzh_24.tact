struct Mixed {
    intVal: Int;
    boolVal: Bool?;
    stringVal: String;
    inner: Inner;
}

struct Inner {
    optInt: Int?;
    optStr: String?;
}

contract TestContract {
    mix: Mixed;

    init() {
        self.mix = Mixed{
            intVal:1,boolVal:null,stringVal:"x",inner:Inner{ optInt:null, optStr:null }
        };
    }
}

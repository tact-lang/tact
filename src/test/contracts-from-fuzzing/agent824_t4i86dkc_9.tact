struct Complex {
    intVal: Int;
    boolVal: Bool;
    optStr: String?;
}

struct Wrapper {
    inner1: Complex;
    inner2: Complex;
    strVal: String;
}

contract TestContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            inner1: Complex{intVal:1, boolVal:true, optStr:null},
            inner2: Complex{intVal:2, boolVal:false, optStr:"abc"},
            strVal: "hello",
        };
    }
}
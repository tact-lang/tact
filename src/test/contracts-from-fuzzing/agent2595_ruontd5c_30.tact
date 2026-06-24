struct Outermost {
    middle1: Middle1;
    middle2: Middle2;
}

struct Middle1 {
    inner1: Inner1;
}

struct Middle2 {
    inner2: Inner2;
}

struct Inner1 {
    intVal: Int;
    strVal: String;
}

struct Inner2 {
    boolVal: Bool;
    optStr: String?;
}

contract WideDeepMix {
    store: Outermost;

    init() {
        self.store = Outermost{
            middle1: Middle1{
                inner1: Inner1{intVal:1,strVal:"a"}
            },
            middle2: Middle2{
                inner2: Inner2{boolVal:true,optStr:null}
            }
        };
    }
}
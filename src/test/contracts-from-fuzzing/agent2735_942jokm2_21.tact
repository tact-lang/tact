struct WrapInt { x: Int; }
struct WrapBool { y: Bool; }
struct WrapString { z: String; }

struct Compose {
    wi: WrapInt;
    wb: WrapBool;
    ws: WrapString;
    wiOpt: WrapInt?;
    wbOpt: WrapBool?;
    wsOpt: WrapString?;
}

contract ManyWrappers {
    data: Compose;

    init() {
        self.data = Compose{
            wi: WrapInt{x:1},
            wb: WrapBool{y:false},
            ws: WrapString{z:"s"},
            wiOpt:null,
            wbOpt:null,
            wsOpt:null,
        };
    }
}

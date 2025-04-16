struct BigNesting {
    a: Int;
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    x: Int?;
    y: Bool;
    z: String?;
}

contract BigCombo {
    field: BigNesting;

    init() {
        self.field = BigNesting{
            a: 10,
            inner1: Inner{x:null, y:true, z:null},
            inner2: Inner{x:5, y:false, z:"hi"}
        };
    }
}

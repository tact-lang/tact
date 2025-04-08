struct InnerOpt {
    foo: Int?;
    bar: Bool;
}

struct MidLevel {
    inner1: InnerOpt;
    inner2: InnerOpt?;
}

contract TestContract {
    rec: MidLevel;

    init() {
        self.rec = MidLevel{
            inner1: InnerOpt{ foo:null, bar:true },
            inner2: null
        };
    }
}
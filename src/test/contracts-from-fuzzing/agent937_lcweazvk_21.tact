struct LargeDeep {
    x1: Int;
    x2: Bool;
    opt: InnerDeep?;
}

struct InnerDeep {
    val: Int;
    s: String;
    deeper: DeeperInner;
}

struct DeeperInner {
    q: Int;
    z: Bool?;
}

contract LargeDeepStruct {
    d: LargeDeep;
    init() {
        self.d = LargeDeep{
            x1: 1,
            x2: true,
            opt: InnerDeep{
                val: 2,
                s: "k",
                deeper: DeeperInner{
                    q: 3,
                    z: null
                }
            }
        };
    }
}
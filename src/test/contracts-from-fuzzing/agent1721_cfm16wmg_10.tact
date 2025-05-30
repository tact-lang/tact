struct SAlpha {
    x: Int;
    y: Bool;
    z: String;
}

struct SBeta {
    p: SAlpha;
    q: SAlpha;
}

contract StructMultiUse {
    data: SBeta;

    init() {
        self.data = SBeta{
            p: SAlpha{ x:1, y:true, z:"one" },
            q: SAlpha{ x:2, y:false, z:"two" },
        };
    }
}
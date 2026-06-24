struct SInner {
    x: Int;
    y: Int;
}

struct SMid {
    a: SInner;
    b: Int?;
}

struct SOut {
    mid: SMid;
}

contract NestedStructOpt {
    data: SOut;

    init() {
        self.data = SOut{
            mid: SMid{
                a: SInner{ x:1, y:2 },
                b: null
            }
        };
    }
}

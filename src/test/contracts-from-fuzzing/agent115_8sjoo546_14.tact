// test multiple nested optional toggles
struct SInner {
    v: Int?;
}

struct SMid {
    x: Bool;
    s: SInner?;
}

struct STop {
    mid: SMid?;
}

contract Test {
    top: STop;
    init() {
        self.top = STop{
            mid: SMid{
                x: true,
                s: SInner{ v: 123 }
            }
        };
    }
}
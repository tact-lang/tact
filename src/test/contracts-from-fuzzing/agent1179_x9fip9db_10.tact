struct SInner {
    a: Int;
    b: String?;
}

struct SMid {
    inner1: SInner;
    inner2: SInner;
}

struct STop {
    mid1: SMid;
    mid2: SMid;
    flag: Bool;
}

contract TestContract {
    data: STop;

    init() {
        self.data = STop{
            mid1: SMid{
                inner1: SInner{a:1,b:null},
                inner2: SInner{a:2,b:"hi"}
            },
            mid2: SMid{
                inner1: SInner{a:3,b:"hello"},
                inner2: SInner{a:4,b:null}
            },
            flag: true
        };
    }

    receive() {}
}
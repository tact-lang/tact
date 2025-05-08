struct BigNested {
    sub1: Inner;
    sub2: Inner;
    optSub: Inner?;
}

struct Inner {
    x: Int;
    y: String;
    flag: Bool;
    note: String?;
}

contract Test {
    data: BigNested;

    init() {
        self.data = BigNested{
            sub1: Inner{ x:1, y:"a", flag:true, note:null },
            sub2: Inner{ x:2, y:"b", flag:false, note:null },
            optSub: null,
        };
    }
}
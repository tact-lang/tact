struct LargeNested {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: InnerA;
    f: InnerB;
}

struct InnerA {
    x: Int;
    y: Bool;
}

struct InnerB {
    z: Int?;
}

contract TestContract {
    val: LargeNested;

    init() {
        self.val = LargeNested{
            a:1,
            b:false,
            c:null,
            d:null,
            e: InnerA{ x:5,y:true },
            f: InnerB{ z:null }
        };
    }
}
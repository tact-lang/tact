struct LargeDeeper {
    a: Int;
    b: GroupB;
    c: Bool;
    d: GroupC;
    e: Int?;
}

struct GroupB {
    x: Int;
    y: Bool;
    z: Int?;
}

struct GroupC {
    m: Bool?;
    n: Int?;
}

contract TestContract {
    s: LargeDeeper;

    init() {
        self.s = LargeDeeper{
            a:1,
            b: GroupB{ x:2, y:true, z:null },
            c:false,
            d: GroupC{ m:null, n:null },
            e:null
        };
    }
}
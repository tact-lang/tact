struct LargeNested1 {
    a: Int;
    b: Int;
    c: Int;
}

struct LargeNested2 {
    p: LargeNested1;
    q: Int;
    r: Bool;
}

struct LargeNested3 {
    x: Int;
    y: LargeNested2;
    z: Bool;
}

contract NestedDeepWide {
    p1: LargeNested3;
    p2: LargeNested3;

    init() {
        self.p1 = LargeNested3{
            x:1,
            y: LargeNested2{ p: LargeNested1{ a:1, b:2, c:3 }, q:4, r:true },
            z:false
        };
        self.p2 = LargeNested3{
            x:10,
            y: LargeNested2{ p: LargeNested1{ a:11, b:12, c:13 }, q:14, r:false },
            z:true
        };
    }
}
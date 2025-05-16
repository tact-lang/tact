struct LargeNested {
    a: Int;
    b: Int;
    c: DeepInner;
}

struct DeepInner {
    x: Bool;
    y: String;
    z: Int?;
}

contract BigNested {
    val: LargeNested;
    init() {
        self.val = LargeNested{
            a:1,
            b:2,
            c:DeepInner{
                x:true,
                y:"deep",
                z:null
            }
        };
    }
}
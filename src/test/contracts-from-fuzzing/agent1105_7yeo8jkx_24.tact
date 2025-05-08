struct BigNested {
    lv1: Int; lv2: String; lv3: Bool;
    nest: BigNested2;
}
struct BigNested2 {
    x: Int; y: Bool; z: String;
}

contract RecursiveLike {
    val: BigNested;
    init() {
        self.val = BigNested{
            lv1:1, lv2:"hi", lv3:true,
            nest: BigNested2{x:42,y:false,z:"ok"}
        };
    }
}
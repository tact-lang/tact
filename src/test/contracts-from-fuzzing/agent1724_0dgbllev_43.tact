struct IntBool {
    a: Int;
    b: Bool;
}

contract IntBoolMix {
    x: Int;
    y: Bool;
    s: IntBool;
    init() {
        self.x=1; self.y=false; self.s=IntBool{a:2,b:true};
    }
}
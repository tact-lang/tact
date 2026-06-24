struct SInner {
    a: Int;
    b: Bool;
}

contract StructAndDirect {
    x: Int;
    y: Bool;
    s: SInner;
    init() {
        self.x = 33;
        self.y = false;
        self.s = SInner{a:1,b:true};
    }
}
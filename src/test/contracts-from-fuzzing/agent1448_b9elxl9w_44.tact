struct SInner {
    a: Int;
    b: Bool;
}

contract StructBasic {
    f: SInner;
    init() {
        self.f = SInner{ a:10, b:true };
    }
}
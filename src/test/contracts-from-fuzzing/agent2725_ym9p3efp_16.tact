struct SInner { f1: Int; f2: Bool }

contract TwoNested {
    a: SInner;
    b: SInner;

    init() {
        self.a = SInner{ f1:1, f2:true };
        self.b = SInner{ f1:2, f2:false };
    }
}
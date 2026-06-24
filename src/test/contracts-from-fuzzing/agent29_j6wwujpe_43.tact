struct BoolChain {
    a: Bool;
}
struct BoolNest {
    b: BoolChain;
    c: Bool;
    d: Bool;
    e: BoolChain;
}

contract BoolNestContract {
    saved: BoolNest;

    init() {
        self.saved = BoolNest{
            b:BoolChain{a:true}, c:false, d:true, e:BoolChain{a:false}
        };
    }
}
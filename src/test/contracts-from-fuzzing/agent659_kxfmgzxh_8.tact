struct SChild {
    a: Int;
    b: Bool;
}

struct SParent {
    c: Int;
    s: SChild;
    d: Bool;
}

contract Interleaved {
    data: SParent;

    init() {
        self.data = SParent{c:1, s:SChild{a:2,b:false}, d:true};
    }
}

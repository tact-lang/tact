struct LeafA { val: Int; }
struct LeafB { flag: Bool; }
struct LeafC { addr: Address?; }

struct Inner {
    la: LeafA;
    lb: LeafB;
    lc: LeafC;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract ComplexTreeOpt {
    store: Outer;

    init() {
        self.store = Outer{
            first: Inner{
                la: LeafA{val:1},
                lb: LeafB{flag:true},
                lc: LeafC{addr: null},
            },
            second: Inner{
                la: LeafA{val:2},
                lb: LeafB{flag:false},
                lc: LeafC{addr: null},
            },
        };
    }
}
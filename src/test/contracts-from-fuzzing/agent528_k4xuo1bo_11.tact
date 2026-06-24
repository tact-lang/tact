struct SSiblingA {
    a: Int;
}

struct SSiblingB {
    b: Int;
}

struct SParent {
    sa: SSiblingA;
    sb: SSiblingB;
}

contract TestContract {
    parent: SParent;
    init() {
        self.parent = SParent{
            sa: SSiblingA{a:14},
            sb: SSiblingB{b:42}
        };
    }
}
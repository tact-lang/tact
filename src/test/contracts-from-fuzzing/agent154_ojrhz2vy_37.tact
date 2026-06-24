struct ZeroNestInner { x: Int; }

struct ZeroNestOuter {
    nested: ZeroNestInner;
}

contract ZeroNestSetter {
    val: ZeroNestOuter;

    init() {
        self.val = ZeroNestOuter { nested: ZeroNestInner { x: 0 } };
    }
}
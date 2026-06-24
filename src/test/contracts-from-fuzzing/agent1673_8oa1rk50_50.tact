struct DeeperInner {
    val: Int;
}

struct MiddleNested {
    inner: DeeperInner;
}

struct OuterNested {
    mid: MiddleNested;
}

contract AssignDeeper {
    val: OuterNested;

    init() {
        self.val = OuterNested{
            mid: MiddleNested{inner: DeeperInner{val:42}}
        };
    }
}
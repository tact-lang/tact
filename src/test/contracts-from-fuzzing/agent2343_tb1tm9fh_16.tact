struct RecInner {
    a: Int;
    flag: Bool;
}

struct RecOuter {
    inner: RecInner;
    bflag: Bool?;
}

contract NestedOptionalInsideOptional {
    val: RecOuter?;

    init() {
        self.val = null;
    }
}

struct NestedOpt1 {
    opt: Int?;
}

struct NestedOpt2 {
    inner: NestedOpt1?;
}

contract NestedNulls {
    val: NestedOpt2;

    init() {
        self.val = NestedOpt2{
            inner: null
        };
    }
}
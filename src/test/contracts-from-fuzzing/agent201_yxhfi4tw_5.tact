struct InnerMost {
    val: Int;
}

struct Inner {
    nest: InnerMost?;
}

contract Test5 {
    s: Inner = Inner{nest: null};
}
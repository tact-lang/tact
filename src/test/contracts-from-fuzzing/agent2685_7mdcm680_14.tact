struct NestedStrOpt {
    s: String?;
    inner: Inner2?;
}

struct Inner2 {
    i: Int;
    f: Bool?;
}

contract Q {
    n: NestedStrOpt = NestedStrOpt{ s:null, inner:null };
}

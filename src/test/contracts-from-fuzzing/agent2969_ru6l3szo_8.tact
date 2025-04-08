struct Combo {
    val: Int?;
    inner: Inner?;
}

struct Inner {
    foo: Bool;
}

contract Test {
    combo: Combo = Combo{val: null, inner: null};
}
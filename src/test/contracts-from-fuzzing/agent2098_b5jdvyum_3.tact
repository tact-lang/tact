struct Deep {
    sub: Inner;
    val: Int?;
}

struct Inner {
    x: Int;
    y: Int;
}

contract DeepNestedStorage {
    d: Deep = Deep{
        sub: Inner{x: 1, y: 2},
        val: null
    };
}

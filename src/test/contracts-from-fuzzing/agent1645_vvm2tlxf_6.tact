struct Inner {
    optInt: Int?;
    optBool: Bool?;
}

struct Outer {
    inner: Inner?;
    count: Int = 0;
}

contract OptStructNest {
    data: Outer? = null;

    init() {}
}
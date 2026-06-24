struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Int?;
    y: Inner;
    z: String?;
}

contract TestContract {
    d: Outer? = null;
    init() {}
}
// contract with large defaulted nested struct
struct Inner {
    a: Int = 3;
    b: Bool = false;
    str: String = "hi";
}

struct S {
    inner: Inner = Inner{};
    note: String = "note";
}

contract LargeDefaulted {
    val: S = S{};

    init() {}
}

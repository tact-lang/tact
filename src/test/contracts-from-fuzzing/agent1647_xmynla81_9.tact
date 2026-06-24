struct Inner {
    val: Int? = null;
    txt: String = "abc";
}

struct Outer {
    ok: Bool = false;
    nested: Inner = Inner{};
}

contract Test(
    param: Outer,
) {}

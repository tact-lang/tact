message(99) M {
    s: String?;
}

struct S {
    m: M?;
}

contract DeepOptionalChain {
    s: S? = null;

    init() {}
}
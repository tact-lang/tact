// deeply nested optional, third variant
struct DeepInner {
    foo: Int;
}

struct Mid {
    val: DeepInner?;
}

struct Top {
    mid: Mid;
}

contract MultiOpt3 {
    storage: Top? = null;
}
// nested optional fields deep in multi-level records, second variant
struct DeepInner {
    foo: Int?;
}

struct Mid {
    val: DeepInner;
}

struct Top {
    mid: Mid?;
}

contract MultiOpt2 {
    storage: Top? = null;
}
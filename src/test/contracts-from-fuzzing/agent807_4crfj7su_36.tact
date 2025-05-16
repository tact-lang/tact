// nested optional fields deep in multi-level records
struct DeepInner {
    foo: Int?;
}

struct Mid {
    val: DeepInner?;
}

struct Top {
    mid: Mid?;
}

contract MultiOpt {
    storage: Top? = null;
}
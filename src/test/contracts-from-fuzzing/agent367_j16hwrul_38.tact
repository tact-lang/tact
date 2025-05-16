// deeply nested optional structs in params
struct DeepInner {
    val: Int?;
}

struct MidInner {
    inner: DeepInner?;
}

struct Outer {
    nested: MidInner?;
}

contract DeeplyOptParams(
    payload: Outer?,
    id: Int
) {
    receive() {}
}
struct DeepInner {
    val: Int;
}

struct Middle {
    maybeDeep: DeepInner?;
}

contract Test {
    data: Middle = Middle{ maybeDeep: null };
}
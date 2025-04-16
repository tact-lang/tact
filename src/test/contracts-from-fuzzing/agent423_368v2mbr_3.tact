struct DeepInner {
    x: Int;
    y: Bool;
}

struct Middle {
    m: DeepInner;
    n: Bool;
}

contract DeepNestedStorage {
    data: Middle = Middle{ m: DeepInner{ x: 42, y: false }, n: true };
}
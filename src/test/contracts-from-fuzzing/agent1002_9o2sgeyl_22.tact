struct Inception {
    val: Int;
    sub: Int?;
}

struct Dream {
    inner: Inception?;
    outer: Bool;
}

contract NullableNested {
    layer: Dream?;

    init() {
        self.layer = Dream{ inner: null, outer: true };
    }
}
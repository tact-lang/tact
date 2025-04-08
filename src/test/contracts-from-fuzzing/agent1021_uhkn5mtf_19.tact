// Test default values inside nested structs
struct InnerMost {
    x: Int = 2;
    y: Int = 3;
}

struct InnerMid {
    im: InnerMost = InnerMost{};
    s: String = "hi";
}

contract NestedDefaults {
    val: InnerMid = InnerMid{};
}
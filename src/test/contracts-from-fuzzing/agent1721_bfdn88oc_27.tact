// test with string optional deeply nested
struct DeepStrOptInner { s: String?; }
struct DeepStrOptMiddle { inner: DeepStrOptInner?; }
struct DeepStrOptOuter { middle: DeepStrOptMiddle?; }

contract DeepNestedStringOptional {
    s: DeepStrOptOuter;
    init() {
        self.s = DeepStrOptOuter { middle: null };
    }
}

struct NestedNested {
    data: String?;
}
struct MiddleNested {
    inner: NestedNested?;
}
contract ManyNullNests {
    m: MiddleNested?;
    init() {
        self.m = null;
    }
}
// Contract with huge number of optional fields and nested levels
struct InnerMost { v: Int?; }
struct Inner { inner: InnerMost?; }
struct Container1 { inner: Inner?; }
struct Container2 { inner: Inner?; }

contract HugeNestedOptional {
    f1: Container1?;
    f2: Container2?;

    init() {
        self.f1 = null;
        self.f2 = null;
    }
}
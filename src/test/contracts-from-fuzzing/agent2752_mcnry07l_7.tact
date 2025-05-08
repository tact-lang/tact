struct InnerMost {
    val: Int = 1;
}

struct Inner {
    a: InnerMost = InnerMost{};
    b: InnerMost = InnerMost{};
}

contract DeepNestedStruct {
    data: Inner = Inner{};
}
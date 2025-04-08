struct InnerMost {
    v: Int = 42;
}

struct Mid {
    s: String = "Hello world this is quite a long string for testing purposes";
    i: InnerMost = InnerMost{};
}

struct OuterMost {
    m: Mid = Mid{};
}

contract DeepAndString {
    outer: OuterMost = OuterMost{};
}
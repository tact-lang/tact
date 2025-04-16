struct InnerMost {
    m: Int?;
    n: Int = 99;
}

struct Inner {
    a: Int = 1;
    b: Int? = null;
    im: InnerMost?;
}

contract DeepMix {
    data: Inner = Inner{};
}
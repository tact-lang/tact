struct InnerMost {
    z: Int = 7;
    w: Int?;
}

struct Inner {
    a: Int = 1;
    im: InnerMost?;
}

struct Top {
    inner: Inner?;
}

contract DeepDefaults {
    data: Top = Top{};
}
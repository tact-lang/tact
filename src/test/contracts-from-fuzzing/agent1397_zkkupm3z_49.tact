// deeply nested mix with some optionals defaulted
struct InnerMost {
    val: Int = 7;
}
struct Mid {
    inner: InnerMost?;
}
struct Outer {
    mid: Mid?;
}

contract DeepDefaults {
    data: Outer;

    init() {
        self.data = Outer{ mid: null };
    }
}
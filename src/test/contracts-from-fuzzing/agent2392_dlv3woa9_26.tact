struct OptionalDeep {
    inner: Inner?;
}

struct Inner {
    val: Int?;
}

contract DeepOption {
    v: OptionalDeep = OptionalDeep{ inner: null };
}
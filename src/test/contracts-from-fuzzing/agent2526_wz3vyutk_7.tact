struct InnerMost {
    foo: Int;
}

struct Inner {
    nested: InnerMost?;
    flag: Bool;
}

contract TestStorage {
    deep: Inner = Inner{ flag: false };
}
struct InnerMost {
    foo: Int;
}

struct Inner {
    nested: InnerMost;
    flag: Bool;
}

contract TestStorage {
    deep: Inner = Inner{ nested: InnerMost{ foo: 1 }, flag: true };
}
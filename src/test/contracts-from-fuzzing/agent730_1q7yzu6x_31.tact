struct InnerMost {
    a: Int;
}

struct Inner {
    innerMost: InnerMost;
}

contract InnerStructDefault {
    inner: Inner = Inner{ innerMost: InnerMost{ a: 123 } };
}

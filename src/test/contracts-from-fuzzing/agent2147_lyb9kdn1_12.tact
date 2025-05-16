struct InnerMost {
    val: Int = 99;
}

struct Inner {
    deep: InnerMost?;
}

contract ExplicitNestInit {
    nested: Inner = Inner{
        deep: InnerMost{}
    };
}
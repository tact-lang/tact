struct InnerMost {
    x: Int;
    y: String = "bar";
}

struct Inner {
    innerMost: InnerMost;
    flag: Bool = true;
}

contract TestDeepNest {
    nested: Inner = Inner{
        innerMost: InnerMost{
            x: 7,
            // omit y, uses default
        },
        // omit flag, uses default
    };
}

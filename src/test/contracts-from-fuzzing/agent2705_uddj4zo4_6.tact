struct DeepInner {
    f: Bool;
}

struct Mid {
    i: Int?;
    d: DeepInner;
}

struct Outer {
    mid: Mid;
}

contract DeepOpt {
    nested: Outer = Outer{
        mid: Mid{
            i: null,
            d: DeepInner{ f: true }
        }
    };
}
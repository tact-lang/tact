struct InnerMost {
    y: Int?;
}

struct Mid {
    z: InnerMost?;
}

struct Outer {
    m: Mid?;
}

contract PartialNestedOptionals {
    val: Outer = Outer{
        m: Mid{z: null}
    };
}
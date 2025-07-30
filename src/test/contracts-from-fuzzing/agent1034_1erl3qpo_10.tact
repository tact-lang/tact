struct InnerMost {
    z: Int;
}

struct Middle {
    innerMost: InnerMost?;
}

contract DeepOptionalNested {
    state: Middle = Middle{ innerMost: null };
}
struct SInner {
    x: Int?;
}

struct SMiddle {
    in1: SInner?;
    in2: SInner?;
}

struct SOuter {
    mid1: SMiddle?;
    mid2: SMiddle?;
}

contract CombineOptionals {
    theField: SOuter?;
}
struct InnerMost {
    val: Int;
}

struct InnerMid {
    innerMost: InnerMost?;
}

struct Outer {
    innerMid: InnerMid?;
}

contract TestContract {
    nestedDeep: Outer = Outer{
        innerMid: null
    };
}
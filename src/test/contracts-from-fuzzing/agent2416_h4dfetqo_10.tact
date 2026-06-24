struct InnerMost {
    z: Int;
}

struct Inner {
    y: Int;
    deep: InnerMost;
}

struct Outer {
    x: Int;
    nest: Inner;
}

contract StructWithDefaultNested {
    val: Outer = Outer{
        x: 1,
        nest: Inner{ y: 5, deep: InnerMost{z:10} }
    };
}
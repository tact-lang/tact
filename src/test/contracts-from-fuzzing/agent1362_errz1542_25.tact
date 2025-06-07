struct InnerMost {
    val: Int;
}

struct Middle {
    mval: InnerMost;
}

struct Outer {
    oval: Middle;
}

contract ThreeLayerStructField {
    val: Outer = Outer{ oval: Middle{ mval: InnerMost{ val: 123 } } };
}
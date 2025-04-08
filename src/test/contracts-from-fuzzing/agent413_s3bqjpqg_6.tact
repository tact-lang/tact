struct Inner {
    z: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    mid: Middle;
}

contract DeepNested {
    val: Outer = Outer{mid: Middle{inner: Inner{z: 42}}};
}
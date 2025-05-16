struct Inner {
    a: Int;
    b: Int;
}

struct Wrapper {
    x: Int;
    y: Inner;
}

contract NestedMixed {
    val: Wrapper = Wrapper{x: 5, y: Inner{a:1,b:2}};
}
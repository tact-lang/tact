struct Inner {
    x: Int;
    y: Int?;
}

struct Middle {
    inner1: Inner;
    inner2: Inner?;
}

struct Outer {
    middle: Middle;
    middleOpt: Middle?;
}

contract DeepNestedOptionals {
    state: Outer = Outer{
        middle: Middle{
            inner1: Inner{x: 1, y: 2},
            inner2: null
        },
        middleOpt: null
    };
}
struct Inner {
    x: Int?;
}

struct Middle {
    innerOpt: Inner?;
}

struct Outer {
    middleOpt: Middle?;
}

contract OptionalNestedTest {
    data: Outer = Outer{
        middleOpt: Middle{
            innerOpt: Inner{
                x: 42
            }
        }
    };
}

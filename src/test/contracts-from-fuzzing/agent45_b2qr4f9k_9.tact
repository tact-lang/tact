struct Inner {
    number: Int;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract NestedOptionals {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{
                inner: Inner{
                    number: 42
                }
            }
        };
    }
}
struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract Wrapped {
    wrapped: Outer;

    init() {
        self.wrapped = Outer{
            middle: Middle{
                inner: Inner{
                    x: 123,
                    y: 456
                }
            }
        };
    }
}
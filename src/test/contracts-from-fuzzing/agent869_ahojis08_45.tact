// test optional type nested multiple levels inside parameters
struct InnerMost { x: Int?; }
struct Middle { inner: InnerMost?; }
struct Outer { middle: Middle?; }

contract NestedDeepOpt(
    param: Outer?
) {}
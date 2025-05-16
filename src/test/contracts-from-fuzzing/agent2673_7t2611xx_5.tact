struct InnerMost {
    a: Int;
}
struct Middle {
    inner: InnerMost?;
}
struct Outer {
    middle: Middle?;
}

contract OptionalNest {
    data: Outer?;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{ a: 42 }
            }
        };
    }
}
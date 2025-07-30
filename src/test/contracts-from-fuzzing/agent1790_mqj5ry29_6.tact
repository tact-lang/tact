struct Inner {
    value: Int;
}
struct Mid {
    inner: Inner;
}
struct Outer {
    mid: Mid;
}

contract OptionalDeep {
    param: Outer?;

    init() {
        self.param = Outer{
            mid: Mid{
                inner: Inner{value: 77}
            }
        };
    }
}

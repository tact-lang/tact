struct Inner {
    inner_value: Int;
}

struct Middle {
    mid_value: Int;
    inner: Inner;
}

struct Outer {
    outer_value: Int;
    middle: Middle;
    flag: Bool;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            outer_value: 7,
            middle: Middle{
                mid_value: 42,
                inner: Inner{inner_value: 99}
            },
            flag: false
        };
    }
}
struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    in1: Inner;
    optInt: Int?;
}

struct Outer {
    mid: Middle;
    flag: Bool;
}

contract NestedStructs {
    value: Outer;

    init() {
        self.value = Outer{
            mid: Middle{
                in1: Inner{x: 1, y: 2},
                optInt: 10,
            },
            flag: true
        };
    }
}

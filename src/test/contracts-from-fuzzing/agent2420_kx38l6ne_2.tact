struct Inner {
    a: Int;
    b: Int?;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    num: Int;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    a: 5,
                    b: null,
                },
                flag: true,
            },
            num: 10,
        };
    }
}
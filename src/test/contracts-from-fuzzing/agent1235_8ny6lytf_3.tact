struct Inner {
    val: Int?;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{ val: null },
                flag: true
            }
        };
    }
}
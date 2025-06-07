struct Inner {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract NestedStructs {
    val: Outer;
    init() {
        self.val = Outer{
            mid: Mid{
                inner: Inner{
                    f1: 5,
                    f2: true,
                    f3: "hi"
                }
            }
        };
    }
}
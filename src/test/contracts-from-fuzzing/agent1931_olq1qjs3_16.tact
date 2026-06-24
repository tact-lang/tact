struct Wrapper {
    a: Outer?;
}

struct Outer {
    b: Inner?;
}

struct Inner {
    c: Int;
}

contract DoubleOption {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            a: Outer{
                b: Inner{c: 999}
            }
        };
    }
}
struct InnerMost {
    flag: Bool;
}

struct Inner {
    innermost: InnerMost;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    val: Outer = Outer{
        inner: Inner{
            innermost: InnerMost{
                flag: true
            }
        }
    };
}
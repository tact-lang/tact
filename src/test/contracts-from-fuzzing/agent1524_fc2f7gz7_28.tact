// outer struct optional and inner has defaults
struct Inner {
    f1: Int = 1;
    f2: Bool = false;
}

struct Outer {
    inner: Inner?;
}

contract DefaultInnerOpt {
    data: Outer?;

    init() {
        self.data = Outer{
            inner: Inner{}
        };
    }
}
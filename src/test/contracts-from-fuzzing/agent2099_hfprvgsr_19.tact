struct BoolNest {
    b1: Bool;
    b2: Bool;
}

struct Container {
    inner: BoolNest;
}

contract NestedBoolsContract {
    s: Container;

    init() {
        self.s = Container{
            inner: BoolNest{b1:true, b2:false}
        };
    }
}
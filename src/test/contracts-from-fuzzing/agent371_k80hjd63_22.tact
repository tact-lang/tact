struct NestedDefaults {
    a:Int = 1;
    inner: InnerNested;
}

struct InnerNested {
    b:Int = 2;
    c:Int = 3;
}

contract TestContract {
    s: NestedDefaults;
    init() {
        self.s = NestedDefaults{
            inner: InnerNested{}
        };
    }
}

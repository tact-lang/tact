struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    s: OptionalNested;
    
    init() {
        self.s = OptionalNested{
            inner: Inner{val: 1, flag: true}
        };
    }
}

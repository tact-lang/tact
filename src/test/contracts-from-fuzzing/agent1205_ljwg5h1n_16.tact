contract NestedStructsOptionals {
    nested: Outer?;
}

struct Outer {
    inner: Inner;
}

struct Inner {
    val: Int?;
}

contract TestContract {
    nested: Outer?;
    
    init() {
        self.nested = null;
    }
}
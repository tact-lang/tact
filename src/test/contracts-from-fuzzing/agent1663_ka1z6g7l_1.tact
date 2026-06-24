struct Inner {
    val1: Int;
    val2: Bool;
}

struct Outer {
    nested: Inner;
    count: Int;
}

contract NestedContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{
                val1: 1,
                val2: true,
            },
            count: 42
        };
    }
}
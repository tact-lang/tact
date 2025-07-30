struct Inner {
    val: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    field1: Outer;
    
    init() {
        self.field1 = Outer{
            inner: Inner{
                val: 5,
                flag: true
            }
        };
    }
}
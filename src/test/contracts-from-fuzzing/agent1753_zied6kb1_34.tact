struct Inner {
    x: Int? = null;
    y: Bool? = null;
}

struct Outer {
    inner: Inner?;
    z: String = "hello";
}

contract CombinationDefaultsNulls {
    data: Outer?;
    
    init() {
        self.data = null;
    }
}
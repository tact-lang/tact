struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    s: String?;
    flag: Bool?;
}

contract OptionalNestedStorage {
    val: OptionalNested;
    
    init() {
        self.val = OptionalNested{
            inner: null
        };
    }
}
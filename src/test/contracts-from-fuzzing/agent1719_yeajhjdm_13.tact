struct JustBool {
    b: Bool;
}

struct NestedBool {
    inner: JustBool;
}

contract NestedBoolStorage {
    data: NestedBool;
    
    init() {
        self.data = NestedBool{
            inner: JustBool{
                b: false
            }
        };
    }
}
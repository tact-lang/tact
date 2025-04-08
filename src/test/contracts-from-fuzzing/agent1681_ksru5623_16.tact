struct NestedOptionalStruct {
    inner: Int?;
    s: String?;
}

contract NestedOptionalStorage {
    d: NestedOptionalStruct?;
    
    init() {
        self.d = null;
    }
}
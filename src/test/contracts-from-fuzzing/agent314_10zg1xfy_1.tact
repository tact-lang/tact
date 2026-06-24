struct NestedOptionalTest {
    innerField: Int?;
}

contract DeepOptionalStorage {
    nested: NestedOptionalTest?;
    
    init() {
        self.nested = null;
    }
}
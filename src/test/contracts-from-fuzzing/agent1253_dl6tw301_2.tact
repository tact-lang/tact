struct NestedLevel2 {
    val2: Int;
}

struct NestedLevel1 {
    val1: NestedLevel2;
}

contract DeepNestedContract {
    nested: NestedLevel1;
    
    init() {
        self.nested = NestedLevel1{ val1: NestedLevel2{ val2: 42 } };
    }
    
    receive() {
        // do nothing
    }
}
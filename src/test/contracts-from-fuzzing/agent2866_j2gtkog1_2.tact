struct NestedLevel2 {
    a: Int;
    b: Bool;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    optionalInner: NestedLevel2?;
}

contract DeepNestTest {
    field1: NestedLevel1;

    init() {
        self.field1 = NestedLevel1{
            inner: NestedLevel2{a: 1, b: true},
            optionalInner: null,
        };
    }
    
    receive() {
        // Do nothing
    }
}
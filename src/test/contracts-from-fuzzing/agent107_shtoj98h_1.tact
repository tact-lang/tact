struct DeepNested {
    inner: NestedLevel1;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

struct NestedLevel2 {
    inner: NestedLevel3;
}

struct NestedLevel3 {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            inner: NestedLevel1{
                inner: NestedLevel2{
                    inner: NestedLevel3{
                        x: 1,
                        y: null
                    }
                }
            }
        };
    }
}

struct NestedLevel3 {
    a: Int;
    b: String;
}

struct NestedLevel2 {
    x: Bool;
    y: NestedLevel3;
}

struct NestedLevel1 {
    m: Int;
    n: NestedLevel2;
}

contract DeepNestedContract {
    storage: NestedLevel1;
    
    init() {
        self.storage = NestedLevel1{
            m: 1,
            n: NestedLevel2{
                x: true,
                y: NestedLevel3{
                    a: 42,
                    b: "deep"
                }
            }
        };
    }
}

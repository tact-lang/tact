struct NestedLevel3 {
    alpha: Int;
    beta: Bool;
}

struct NestedLevel2 {
    inner: NestedLevel3;
    flag: Bool;
}

struct NestedLevel1 {
    wrapped: NestedLevel2;
    count: Int;
}

contract DeepNestedContract {
    data: NestedLevel1;
    
    init() {
        self.data = NestedLevel1{
            wrapped: NestedLevel2{
                inner: NestedLevel3{
                    alpha: 42,
                    beta: true
                },
                flag: false
            },
            count: 100
        };
    }
}
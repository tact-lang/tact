struct NestedLevel3 {
    a: Int;
    b: Int?;
}

struct NestedLevel2 {
    x: Int;
    y: NestedLevel3;
    z: Bool?;
}

struct NestedLevel1 {
    k: Bool;
    m: NestedLevel2;
    n: Int?;
}

contract DeepNestedContract {
    data: NestedLevel1;
    
    init() {
        self.data = NestedLevel1{
            k: true,
            m: NestedLevel2{
                x: 123,
                y: NestedLevel3{
                    a: 456,
                    b: null
                },
                z: null
            },
            n: null
        };
    }
}

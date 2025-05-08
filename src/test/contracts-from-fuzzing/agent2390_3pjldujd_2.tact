struct Inner {
    field1: Bool;
    field2: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    count: Int;
}

contract NestedOptionalTest {
    storage: Outer;
    
    init() {
        self.storage = Outer{
            nested: Inner{
                field1: false,
                field2: null,
            },
            flag: true,
            count: 100,
        };
    }
}
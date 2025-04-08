struct InnerMost {
    a: Int;
    b: Bool;
}

struct Nested {
    flag: Bool;
    optInnerMost: InnerMost?;
}

contract DeepNestedTest {
    data: Nested;
    
    init() {
        self.data = Nested{
            flag: true,
            optInnerMost: null
        };
    }
}
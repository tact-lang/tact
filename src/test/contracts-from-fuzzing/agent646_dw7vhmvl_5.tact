struct DeepOptionalNest {
    nested: InnerOptional;
    flag: Bool;
}

struct InnerOptional {
    value: Int?;
}

contract DeepOptionalTest {
    data: DeepOptionalNest;
    
    init() {
        self.data = DeepOptionalNest{
            nested: InnerOptional{
                value: null
            },
            flag: true
        };
    }
}
struct DeepWithOptions {
    id: Int;                      
    optInner: Inner?;              
}

struct Inner {
    flag: Bool;                   
    desc: String?;               
}

contract NestedOptionals {
    nested: DeepWithOptions;

    init() {
        self.nested = DeepWithOptions{
            id: 99,
            optInner: Inner{ flag: false, desc: null },
        };
    }
}
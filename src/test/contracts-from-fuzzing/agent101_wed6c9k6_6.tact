struct OptionalInOptional {
    innerOptOpt: Inner?;
}

struct Inner {
    deepOpt: Int?;
}

contract OptOptContract {
    store: OptionalInOptional;
    
    init() {
        self.store = OptionalInOptional{
            innerOptOpt: Inner{
                deepOpt: null,
            },
        };
    }
}
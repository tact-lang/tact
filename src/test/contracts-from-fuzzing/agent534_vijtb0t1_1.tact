struct Inner {
    flag: Bool;
    number: Int?;
}

contract DeepNest {
    nested: Inner;
    
    init() {
        self.nested = Inner{
            flag: true,
            number: null,
        };
    }
}
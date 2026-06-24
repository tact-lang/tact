struct Wrapper {
    nested: InnerOptional;
}

struct InnerOptional {
    a: Int?;
    b: Bool?;
}

contract TestOpt {
    wrap: Wrapper;
    
    init() {
        self.wrap = Wrapper{
            nested: InnerOptional{ a: null, b: null }
        };
    }
}
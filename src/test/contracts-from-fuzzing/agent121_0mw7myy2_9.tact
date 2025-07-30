struct InnerOptional {
    value: Int?;
}

struct Mid {
    inner1: InnerOptional;
    inner2: InnerOptional;
}

contract NestedOptionals {
    mid: Mid;
    
    init() {
        self.mid = Mid{
            inner1: InnerOptional{ value: null },
            inner2: InnerOptional{ value: 55 },
        };
    }
}
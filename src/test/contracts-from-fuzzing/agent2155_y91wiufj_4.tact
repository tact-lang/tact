struct InnerMost {
    value: Int;
    flag: Bool;
}

struct Inner {
    maybeDeep: InnerMost?;
    counter: Int;
}

struct Outer {
    wrap: Inner;
    active: Bool;
}

contract DeepOptional {
    o: Outer;
    
    init() {
        self.o = Outer{
            wrap: Inner{
                maybeDeep: null,
                counter: 7
            },
            active: true
        };
    }
}
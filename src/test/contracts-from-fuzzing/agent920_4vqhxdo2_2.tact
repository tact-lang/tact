struct Deep {
    level: Int;
    deeper: Inner;
}

struct Inner {
    inside: Bool;
}

contract TestContract {
    nested: Deep;
    
    init() {
        self.nested = Deep{
            level: 5,
            deeper: Inner{ inside: false }
        };
    }
}
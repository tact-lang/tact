struct InnerMost {
    z: Bool?;
    w: Int;
}

struct Inner {
    x: InnerMost;
    y: String;
}

contract NestedOptionals {
    field: Inner;
    
    init() {
        self.field = Inner{
            x: InnerMost{ z:null, w:42 },
            y: "nested"
        };
    }
}
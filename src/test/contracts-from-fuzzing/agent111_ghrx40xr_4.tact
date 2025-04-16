struct InnerMost {
    z: Bool;
}

struct Inner {
    innerMost: InnerMost;
    y: Int;
}

struct Outer {
    x: Int;
    nested: Inner;
}

contract DeepNested {
    data: Outer;
    
    init() {
        self.data = Outer{
            x: 1,
            nested: Inner{
                innerMost: InnerMost{z:true},
                y: 2
            }
        };
    }
}
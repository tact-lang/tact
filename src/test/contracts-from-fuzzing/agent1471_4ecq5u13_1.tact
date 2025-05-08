struct Inner {
    innerVal: Int = 5;
}

struct Outer {
    outerVal: Int = 10;
    nested: Inner;
}

contract Test {
    data: Outer = Outer{
        nested: Inner{},
        outerVal: 10,
    };
    
    init() {
        self.data = Outer{
            nested: Inner{innerVal: 42},
            outerVal: 11,
        };
    }
}
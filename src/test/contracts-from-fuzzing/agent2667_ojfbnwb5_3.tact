struct DeepNest3 {
    d: Int;
}

struct DeepNest2 {
    c: DeepNest3;
}

struct DeepNest1 {
    b: DeepNest2;
}

contract DeepNestingTest {
    field: DeepNest1;
    
    init() {
        self.field = DeepNest1{
            b: DeepNest2{
                c: DeepNest3{d: 123}
            }
        };
    }
    
    receive() {
        self.field = DeepNest1{
            b: DeepNest2{
                c: DeepNest3{d: 456}
            }
        };
    }
}
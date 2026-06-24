struct DeepNest1 {
    x: Int;
    y: Int?;
}

struct DeepNest2 {
    a: DeepNest1;
    b: DeepNest1?;
}

contract Test {
    s: DeepNest2;
    
    init() {
        self.s = DeepNest2{
            a: DeepNest1{x: 1, y: 2},
            b: DeepNest1{x: 3, y: null}
        };
    }
}
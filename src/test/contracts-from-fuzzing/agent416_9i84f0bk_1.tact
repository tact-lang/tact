struct Inner {
    x: Int;
    y: Int?;
}

contract DeepNestTest {
    field: Inner;
    
    init() {
        self.field = Inner{
            x: 1,
            y: null
        };
    }
}
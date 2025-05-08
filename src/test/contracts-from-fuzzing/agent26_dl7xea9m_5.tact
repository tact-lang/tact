struct NestedOption {
    a: Int;
    b: String?;
}

contract Test {
    s: NestedOption?;
    
    init() {
        self.s = NestedOption{
            a: 5,
            b: null
        };
    }
}
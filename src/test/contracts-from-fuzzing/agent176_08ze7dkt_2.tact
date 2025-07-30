struct Inner {
    a: Int;
    b: String;
    c: Bool?;
}

contract NestedStructStorage {
    nested: Inner;
    
    init() {
        self.nested = Inner{
            a: 1,
            b: "test",
            c: true,
        };
    }
}
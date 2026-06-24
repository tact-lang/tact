struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract Test {
    foo: Inner;
    
    init() {
        self.foo = Inner{
            x: 10,
            y: true,
            z: "nested",
        };
    }
}
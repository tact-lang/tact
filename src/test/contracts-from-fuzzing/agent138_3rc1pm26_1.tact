struct Inner {
    b: Bool;
    s: String;
}

contract Test {
    complex: Inner;
    
    init() {
        self.complex = Inner{
            b: true,
            s: "hello"
        };
    }
}
struct Inner {
    a: Int;
    b: String;
    c: Bool;
}

contract NestedContract {
    point: Inner;
    
    init() {
        self.point = Inner{
            a: 42,
            b: "nested",
            c: false,
        };
    }
}
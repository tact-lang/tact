struct S { a: Int; b: Int?; c: String? = null; }

contract PartialDefaults {
    data: S;
    
    init() {
        self.data = S{
            a: 42,
            c: null
        };
    }

    receive() {
        let _ = self.data.b;
    }
}
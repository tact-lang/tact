struct S {
    i: Int;
    s: String;
}

contract NoDefaults {
    s: S;
    
    init() {
        self.s = S{
            i: 5,
            s: "x"
        };
    }
}
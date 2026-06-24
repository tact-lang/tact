struct S {
    i: Int;
    b: Bool;
    s: String;
}

contract ZeroDefaults {
    s: S;
    
    init() {
        self.s = S{
            i: 0,
            b: false,
            s: ""
        };
    }
}
struct S1 {
    a: Int;
    b: Int?;
    c: Bool;
}

contract TestContract {
    f: S1;
    
    init() {
        self.f = S1{
            a: 1,
            b: null,
            c: true
        };
    }
}
struct S {
    a: Int;
    b: Bool;
}

contract TestContract {
    s: S = S{ a:5, b:true };
    
    init() {
        self.s = S{ a: 100, b: false };
    }

    receive() {}
}
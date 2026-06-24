struct X {
    x: Int;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: X;

    init() {
        self.a=1;
        self.b=true;
        self.c="string";
        self.d=X{x:5};
    }
    
    receive() {}
}
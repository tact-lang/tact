struct Container {
    a: Int;
    b: Bool;
}

contract ManyVars {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Container;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 2;
        self.d = false;
        self.e = Container{ a:3, b:true };
    }
}
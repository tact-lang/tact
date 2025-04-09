struct X {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    xa: X;
    xb: X;

    init() {
        self.xa = X{a:1,b:true,c:"a"};
        self.xb = X{a:2,b:false,c:"b"};
    }
}
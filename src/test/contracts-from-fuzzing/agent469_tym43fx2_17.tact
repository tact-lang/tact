struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract ManyStructs {
    one: S;
    two: S;
    three: S;

    init() {
        self.one = S{ a:1, b:"x", c:true };
        self.two = S{ a:2, b:"y", c:false };
        self.three = S{ a:3, b:"z", c:true };
    }
}
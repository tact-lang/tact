struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract C {
    one: S;
    two: S;

    init() {
        self.one = S{a:1,b:true,c:"A"};
        self.two = S{a:2,b:false,c:"B"};
    }
}
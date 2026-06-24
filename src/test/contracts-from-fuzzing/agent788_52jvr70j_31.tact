struct X {
    a: Int;
    b: Bool;
    c: String;
}

contract SameStructTwice {
    x1: X;
    x2: X;

    init() {
        self.x1 = X{a:1,b:true,c:"a"};
        self.x2 = X{a:2,b:false,c:"b"};
    }
}
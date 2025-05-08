struct Small1 {
    a: Int;
}

struct Small2 {
    b: Int;
}

struct Small3 {
    c: Int;
}

contract ManySmallStructs {
    one: Small1;
    two: Small2;
    three: Small3;

    init() {
        self.one = Small1{ a:1 };
        self.two = Small2{ b:2 };
        self.three = Small3{ c:3 };
    }
}
struct A1 {
    a: Int;
}

struct A2 {
    b: Int;
}

struct A3 {
    c: Int;
}

contract Test {
    one: A1;
    two: A2;
    three: A3;

    init() {
        self.one = A1{a:10};
        self.two = A2{b:20};
        self.three = A3{c:30};
    }
}
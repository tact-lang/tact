struct B {
    b1: Int;
    b2: Bool;
}

struct A {
    a1: Int;
    a2: B;
}

contract ManyStructsTest {
    one: Int;
    two: Bool;
    three: A;
    four: B;

    init() {
        self.one = 1;
        self.two = true;
        self.three = A{ a1: 2, a2: B{b1:3, b2:false} };
        self.four = B{b1:4, b2:true};
    }
}
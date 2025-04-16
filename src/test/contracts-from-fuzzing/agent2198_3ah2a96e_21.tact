struct A { x: Int; }
struct B { y: Int; }

contract ManyStructFields {
    a: A;
    b: B;
    a2: A;
    b2: B;
    a3: A;

    init() {
        self.a = A{x:1};
        self.b = B{y:2};
        self.a2 = A{x:3};
        self.b2 = B{y:4};
        self.a3 = A{x:5};
    }
}
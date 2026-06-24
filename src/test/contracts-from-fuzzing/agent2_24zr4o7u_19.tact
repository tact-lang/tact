struct A {
    x: Int;
}

struct B {
    y: Bool;
}

contract ManyStructs {
    a1: A;
    a2: A;
    b1: B;
    b2: B;
    b3: B;
    a3: A;

    init() {
        self.a1=A{x:1};
        self.a2=A{x:2};
        self.b1=B{y:true};
        self.b2=B{y:false};
        self.b3=B{y:true};
        self.a3=A{x:3};
    }
}
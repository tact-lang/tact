struct A {
    x: Int;
}

struct B {
    y: String;
}

struct C {
    z: Bool;
}

struct D {
    d1: Int?;
    d2: Bool?;
    d3: String;
}

contract TestContract {
    a: A;
    b: B;
    c: C;
    d: D;

    init() {
        self.a = A{x:1};
        self.b = B{y:"test"};
        self.c = C{z:true};
        self.d = D{d1:null,d2:false,d3:""};
    }
}

struct A {
    a1: Int;
}

struct B {
    b1: Bool;
}

struct C {
    c1: String;
}

contract TestContract {
    x: A;
    y: B;
    z: C;
    flag: Bool;
    
    init() {
        self.x = A{a1:1};
        self.y = B{b1:true};
        self.z = C{c1:"ok"};
        self.flag = false;
    }
}
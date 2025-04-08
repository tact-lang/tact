struct A {
    x: Int;
    y: Bool;
    z: String;
}

struct B {
    a1: A;
    a2: A;
    txt: String;
}

struct C {
    b1: B;
    b2: B;
    addr: Address;
}

contract Test14 {
    c: C;
    init() {
        self.c = C{
            b1: B{a1:A{x:1,y:true,z:"x"}, a2:A{x:2,y:false,z:"y"}, txt:"hi"},
            b2: B{a1:A{x:3,y:true,z:"a"}, a2:A{x:4,y:true,z:"b"}, txt:"yo"},
            addr: myAddress()
        };
    }
}
struct A {
    x: Int;
    y: Bool;
    z: Int?;
}

contract Test {
    a1: A;
    a2: A;
    a3: A;

    init() {
        self.a1 = A{x:1,y:true,z:null};
        self.a2 = A{x:2,y:false,z:3};
        self.a3 = A{x:3,y:true,z:null};
    }
}
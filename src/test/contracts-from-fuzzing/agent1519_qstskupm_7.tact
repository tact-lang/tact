struct C {
    z: Int;
}

struct B {
    innerC: C;
    flag: Bool?;
}

struct A {
    a1: Int;
    a2: Int;
    b: B;
    a3: Int;
    a4: Bool;
}

contract NestWideTest {
    state: A = A{
        a1:1, a2:2, 
        b: B{innerC: C{z:3}, flag:true}, 
        a3:4, a4:false
    };

    init() {
        self.state = A{
            a1:11, a2:22, 
            b: B{innerC: C{z:33}, flag:null}, 
            a3:44, a4:true
        };
    }
}
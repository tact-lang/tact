struct S5 {
    x: Int;
    y: Bool;
    z: String;
}

contract ArrayTest {
    s0: S5;
    s1: S5;
    s2: S5;

    init() {
        self.s0 = S5{x:1,y:true,z:"a"};
        self.s1 = S5{x:2,y:false,z:"b"};
        self.s2 = S5{x:3,y:true,z:"c"};
    }
}
struct List1 {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
}

struct List2 {
    g1: Int;
    g2: Int;
    g3: Int;
    g4: Int;
    g5: Int;
}

contract ManyStructs {
    a: List1;
    b: List2;

    init() {
        self.a = List1{f1:1,f2:2,f3:3,f4:4,f5:5};
        self.b = List2{g1:6,g2:7,g3:8,g4:9,g5:10};
    }

    receive() {}
}
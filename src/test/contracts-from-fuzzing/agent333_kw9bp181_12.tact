struct A {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
}

struct B {
    b1: A;
    b2: A;
    b3: A;
}

contract TestContract {
    rec: B;

    init() {
        self.rec = B{
            b1: A{ a1:1,a2:2,a3:3,a4:4,a5:5 },
            b2: A{ a1:6,a2:7,a3:8,a4:9,a5:10 },
            b3: A{ a1:11,a2:12,a3:13,a4:14,a5:15 }
        };
    }
}
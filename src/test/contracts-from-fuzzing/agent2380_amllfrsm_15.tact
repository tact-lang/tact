// contract with multiple large nested structs
struct A {
    aa: Int; ab: Int; ac: Int;
}

struct B {
    ba: A; bb: A; bc: Int;
}

struct C {
    c1: B; c2: B; cx: Int;
}

contract TestContract {
    payload: C;
    init() {
        self.payload = C{
            c1: B{ ba: A{aa:1,ab:2,ac:3}, bb: A{aa:4,ab:5,ac:6}, bc:7 },
            c2: B{ ba: A{aa:8,ab:9,ac:10}, bb: A{aa:11,ab:12,ac:13}, bc:14 },
            cx: 15
        };
    }
}
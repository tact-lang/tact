struct Deep1 {
    x: Int;
}

struct Deep2 {
    sub: Deep1;
}

struct Deep3 {
    sub: Deep2;
}

struct Deep4 {
    sub: Deep3;
}

struct Deep5 {
    sub: Deep4;
}

contract DeepNestTest {
    deepData: Deep5;

    init() {
        self.deepData = Deep5{sub: Deep4{sub: Deep3{sub: Deep2{sub: Deep1{x: 42}}}}};
    }
}
struct Deep1 {
    a: Int;
}

struct Deep2 {
    b: Deep1;
}

struct Deep3 {
    c: Deep2;
}

contract TestContract {
    data: Deep3;
    
    init() {
        self.data = Deep3{c: Deep2{b: Deep1{a: 7}}};
    }
}
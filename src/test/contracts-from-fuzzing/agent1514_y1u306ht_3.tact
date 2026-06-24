struct Deep3 {
    leaf: Int;
}

struct Deep2 {
    child: Deep3;
}

struct Deep1 {
    child: Deep2;
}

contract TestContract {
    root: Deep1 = Deep1{child: Deep2{child: Deep3{leaf: 7}}};

    init() {
        self.root = Deep1{child: Deep2{child: Deep3{leaf: 9}}};
    }
}
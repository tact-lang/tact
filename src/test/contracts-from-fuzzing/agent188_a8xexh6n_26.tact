struct Deep {
    a: Int;
    next: Deep2;
}

struct Deep2 {
    b: Int;
    next: Deep3;
}

struct Deep3 {
    c: Int;
}

contract DeepChain {
    data: Deep;

    init() {
        self.data = Deep {
            a:1,
            next: Deep2 {
                b:2,
                next: Deep3{c:3}
            }
        };
    }
}
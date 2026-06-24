struct Deep {
    n1: Int;
    next: Deep2;
}

struct Deep2 {
    n2: Int;
    next: Deep3;
}

struct Deep3 {
    n3: Int;
    next: Deep4;
}

struct Deep4 {
    n4: Int;
}

contract Test {
    field: Deep;

    init() {
        self.field = Deep{
            n1: 1,
            next: Deep2{
                n2: 2,
                next: Deep3{
                    n3: 3,
                    next: Deep4{ n4: 4 }
                }
            }
        };
    }
}
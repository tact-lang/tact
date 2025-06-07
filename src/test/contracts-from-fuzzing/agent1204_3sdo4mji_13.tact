struct Deep1 {
    next: Deep2;
}

struct Deep2 {
    next: Deep3;
}

struct Deep3 {
    next: Deep4;
}

struct Deep4 {
    next: Deep5;
}

struct Deep5 {
    val: Int;
}

contract DeepChain {
    d: Deep1;

    init() {
        self.d = Deep1{
            next: Deep2{
                next: Deep3{
                    next: Deep4{
                        next: Deep5{ val:42 }
                    }
                }
            }
        };
    }
}

struct Chain1 {
    next: Chain2;
}

struct Chain2 {
    next: Chain3;
}

struct Chain3 {
    next: Chain4;
}

struct Chain4 {
    val: Int;
}

contract ChainDeep {
    c: Chain1;
    
    init() {
        self.c = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{ val: 77 }
                }
            }
        };
    }
}
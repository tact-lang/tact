struct Chain1 {
    next: Chain2;
}

struct Chain2 {
    next: Chain3;
}

struct Chain3 {
    flag: Bool;
}

contract Test {
    root: Chain1;
    init() {
        self.root = Chain1{
            next: Chain2{
                next: Chain3{flag:true}
            }
        };
    }
}
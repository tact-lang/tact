struct Chain1 {
    f: Chain2;
}

struct Chain2 {
    f: Chain3;
}

struct Chain3 {
    f: Chain4;
}

struct Chain4 {
    f: Chain5;
}

struct Chain5 {
    x: Int;
}

contract Test6 {
    val: Chain1;
    init() {
        self.val = Chain1{
            f: Chain2{
                f: Chain3{
                    f: Chain4{
                        f: Chain5{x:5}
                    }
                }
            }
        };
    }
}
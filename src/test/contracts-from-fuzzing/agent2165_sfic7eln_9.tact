struct Chain3 {
    c: Int;
}

struct Chain2 {
    b: Chain3;
}

struct Chain1 {
    a: Chain2;
}

contract Test9 {
    link: Chain1;

    init() {
        self.link = Chain1{
            a: Chain2{
                b: Chain3{
                    c: 99
                }
            }
        };
    }
}
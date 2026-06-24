struct Chain1 {
    val: Int;
}

struct Chain2 {
    prev: Chain1;
}

struct Chain3 {
    prev: Chain2;
}

struct Chain4 {
    prev: Chain3;
}

struct Chain5 {
    prev: Chain4;
}

contract Layered {
    top: Chain5;

    init() {
        self.top = Chain5{
            prev: Chain4{
                prev: Chain3{
                    prev: Chain2{
                        prev: Chain1{ val: 100 }
                    }
                }
            }
        };
    }
}
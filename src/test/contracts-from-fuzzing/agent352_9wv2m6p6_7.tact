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
    val: Int;
}

contract Test {
    data: Chain1;

    init() {
        self.data = Chain1{
            f: Chain2{
                f: Chain3{
                    f: Chain4{
                        val: 42
                    }
                }
            }
        };
    }
}
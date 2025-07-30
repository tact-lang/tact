struct Chain3 {
    c: Int;
}

struct Chain2 {
    inner: Chain3;
}

struct Chain1 {
    inner: Chain2;
}

contract TopChain {
    payload: Chain1;
    init() {
        self.payload = Chain1{
            inner: Chain2{
                inner: Chain3{
                    c: 77
                }
            }
        };
    }
}
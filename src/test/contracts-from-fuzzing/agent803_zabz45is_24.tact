struct Chain3 {
    inner: Int;
}

struct Chain2 {
    nested: Chain3;
}

struct Chain1 {
    sub: Chain2;
}

contract FlattenDeep {
    data: Chain1;
    init() {
        self.data = Chain1{
            sub: Chain2{
                nested: Chain3{ inner: 999 }
            }
        };
    }
}
struct Chain3 {
    s: String?;
}

struct Chain2 {
    n: Int?;
    c3: Chain3;
}

struct Chain1 {
    b: Bool?;
    c2: Chain2;
}

contract ChainTest {
    field: Chain1;

    init() {
        self.field = Chain1{
            b: null,
            c2: Chain2{
                n: null,
                c3: Chain3{ s: null },
            }
        };
    }
}
struct Chain3 {
    v3: Int;
}

struct Chain2 {
    v2: Chain3;
}

struct Chain1 {
    v1: Chain2;
}

struct Wrapper {
    outer: Chain1;
}

contract ChainWrap {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            outer: Chain1{ v1: Chain2{ v2: Chain3{ v3: 123 } } }
        };
    }
}
struct Chain1 {
    a: Int = 1;
}

struct Chain2 {
    inner: Chain1 = Chain1{};
}

struct Chain3 {
    inner: Chain2 = Chain2{};
}

struct Chain4 {
    inner: Chain3 = Chain3{};
}

contract ChainNested {
    data: Chain4 = Chain4{};
    init() {}
}
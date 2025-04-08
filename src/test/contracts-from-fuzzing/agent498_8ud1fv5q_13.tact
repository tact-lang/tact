struct Chain3 {
    a: Chain2;
}

struct Chain2 {
    a: Chain1;
}

struct Chain1 {
    value: Int;
}

contract DeepChain {
    c: Chain3 = Chain3{a:Chain2{a:Chain1{value:42}}};
}
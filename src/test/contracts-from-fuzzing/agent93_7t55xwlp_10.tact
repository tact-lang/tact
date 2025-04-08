struct Chain1 {
    a: Int;
}

struct Chain2 {
    b: Chain1;
}

struct Chain3 {
    c: Chain2;
}

contract ChainNested {
    f: Chain3 = Chain3{ c: Chain2{ b: Chain1{ a: 123 } } };
}
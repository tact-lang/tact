struct SInner {
    flag: Bool;
}

struct SOuter {
    inner: SInner;
}

contract StructDefault {
    s: SOuter = SOuter{ inner: SInner{ flag: true } };
}
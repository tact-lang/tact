struct SzInner {
    count: Int as uint64;
}

struct SzOuter {
    nested: SzInner;
    flag: Bool;
}

contract PersistSzStructs {
    val: SzOuter = SzOuter{
        nested: SzInner{ count: 123456789 },
        flag: true,
    };
}

struct S2 {
    a: Int;
}

struct S1 {
    inner: S2;
}

contract DefaultStruct {
    data: S1 = S1{ inner: S2{ a: 42 } };
}
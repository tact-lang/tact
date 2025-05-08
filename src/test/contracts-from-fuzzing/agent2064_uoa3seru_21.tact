struct S11 {
    i: Int;
    s: String;
}

struct S22 {
    first: S11;
    second: S11;
}

contract TwoStructsNested {
    st: S22 = S22{
        first: S11{ i:1, s:"a" },
        second: S11{ i:2, s:"b" }
    };
}

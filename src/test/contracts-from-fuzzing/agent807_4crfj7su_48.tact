// test deep combo of nested messages & structs & optionals
struct S1 {
    foo: Int?;
}

message(501) M1 {
    s: S1?;
}

message(502) M2 {
    inner: M1?;
}

struct Wrapper {
    m2: M2?;
}

contract NestedMix {
    data: Wrapper = Wrapper{ m2: null };
}
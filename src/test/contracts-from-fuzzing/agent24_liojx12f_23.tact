// Nested optionals pointing to struct with optional
struct OptStruct {
    a: Int?;
}

struct Wrapper1 {
    inner: OptStruct?;
}

struct Wrapper2 {
    wrap1: Wrapper1?;
}

contract Test {
    w2: Wrapper2 = Wrapper2{
        wrap1: null
    };

    init() {}
}
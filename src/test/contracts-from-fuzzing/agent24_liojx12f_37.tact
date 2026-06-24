// Struct with optional string and int nested inside optional outer
struct Inner {
    a: String?;
    b: Int?;
}

struct Outer {
    i: Inner?;
}

contract Test {
    outer: Outer = Outer{
        i: Inner{
            a: null,
            b: null
        }
    };

    init() {}
}
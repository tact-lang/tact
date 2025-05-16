// contract parameter variant with nested structs
struct Inner { x: Int; y: String; }
struct Outer { inner: Inner; flag: Bool; }

contract Test(
    data: Outer,
    note: String,
    n: Int
) {}
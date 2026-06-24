// optional primitive in a struct in a struct
struct Inner {
    x: Int?;
}

struct Outer {
    y: Inner;
}

contract Test {
    z: Outer = Outer{ y: Inner{ x:null } };
}
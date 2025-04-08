// nested structs with explicit serialization
struct S1 {
    a: Int as uint4;
    b: Int;
}

struct S2 {
    s: S1;
    c: Int as int120;
}

contract NestedSerialized {
    data: S2;

    init() {
        self.data = S2{
            s: S1{a:15,b:100},
            c:1000,
        };
    }
}
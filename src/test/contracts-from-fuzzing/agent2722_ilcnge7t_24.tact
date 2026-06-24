struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }
struct Inner3 { z: String; }

struct OuterStruct {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

contract NestedDifferent {
    data: OuterStruct;

    init() {
        self.data = OuterStruct {
            a: Inner1 { x: 1 },
            b: Inner2 { y: true },
            c: Inner3 { z: "z" }
        };
    }
}
struct NestedA {
   b: Int;
   c: Bool;
}

struct NestedB {
   inner: NestedA;
}

struct Outer {
    p: Bool;
    q: Int;
    r: NestedB;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            p: true,
            q: 123,
            r: NestedB{
                inner: NestedA{
                    b: 5,
                    c: false,
                }
            }
        };
    }
}
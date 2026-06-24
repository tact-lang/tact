struct NestedA {
    a: Int;
    b: NestedB;
}

struct NestedB {
    c: Int;
    d: NestedC;
}

struct NestedC {
    e: Int;
}

contract TestContract {
    data: NestedA;

    init() {
        self.data = NestedA{
            a:1,
            b: NestedB{
                c:2,
                d: NestedC{
                    e:3
                }
            }
        };
    }
}
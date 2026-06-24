struct X { i: Int }

struct Y { j: Int }

struct WithStructs {
    a: X;
    b: Y;
}

contract CompositeStruct {
    val: WithStructs;

    init() {
        self.val = WithStructs{
            a: X{ i:1 },
            b: Y{ j:2 }
        };
    }
}
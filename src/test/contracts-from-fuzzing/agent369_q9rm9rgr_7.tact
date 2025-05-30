struct NestedStructA {
    a: Int;
}

struct NestedStructB {
    b: Int;
    innerA: NestedStructA;
}

struct NestedStructC {
    c: Int;
    innerB: NestedStructB;
}

contract TestContract {
    nested: NestedStructC;

    init() {
        self.nested = NestedStructC{
            c: 3,
            innerB: NestedStructB{
                b: 2,
                innerA: NestedStructA{
                    a: 1
                }
            }
        };
    }
}
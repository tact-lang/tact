struct A { x: Int }
struct B { y: Int }

struct Container {
    a: A;
    b: B;
    aOpt: A?;
    bOpt: B?;
}

contract NestedOptionalMix {
    val: Container;

    init() {
        self.val = Container{
            a: A{ x: 1 },
            b: B{ y: 2 },
            aOpt: null,
            bOpt: null
        };
    }
}

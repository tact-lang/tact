struct NestedA {
    foo: Int;
    inner: NestedB;
}

struct NestedB {
    bar: Int;
    opt: NestedC?;
}

struct NestedC {
    baz: Bool;
    leaf: NestedD;
}

struct NestedD {
    val: Int;
}

contract TestContract {
    data: NestedA;

    init() {
        self.data = NestedA{
            foo: 1,
            inner: NestedB{
                bar: 2,
                opt: NestedC{
                    baz: true,
                    leaf: NestedD{
                        val: 99
                    }
                }
            }
        };
    }
}

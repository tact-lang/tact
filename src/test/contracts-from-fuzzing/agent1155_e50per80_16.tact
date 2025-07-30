struct OuterMost {
    val: Int;
    nestedA: NestedA;
    nestedB: NestedB;
}

struct NestedA {
    txt: String;
    deeper: NestedDeeper;
}

struct NestedB {
    flag: Bool;
    num: Int;
}

struct NestedDeeper {
    cellData: Cell;
    optBool: Bool?;
}

contract TestContract {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            val: 10,
            nestedA: NestedA{
                txt: "hello",
                deeper: NestedDeeper{
                    cellData: emptyCell(),
                    optBool: null
                }
            },
            nestedB: NestedB{
                flag: true,
                num: -42
            }
        };
    }
}

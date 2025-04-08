struct ChainedNestedLists {
    a: NestedA;
}

struct NestedA {
    b: NestedB;
}

struct NestedB {
    c: NestedC;
}

struct NestedC {
    d: NestedD;
}

struct NestedD {
    e: String;
}

contract ChainedNestedTest {
    data: ChainedNestedLists;

    init() {
        self.data = ChainedNestedLists{
            a: NestedA{
                b: NestedB{
                    c: NestedC{
                        d: NestedD{
                            e: "x"
                        }
                    }
                }
            }
        };
    }
}

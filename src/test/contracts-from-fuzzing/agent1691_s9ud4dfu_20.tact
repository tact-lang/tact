struct RecursiveInner {
    nested: RecursiveDeeper;
}

struct RecursiveDeeper {
    field: Int;
}

struct RecursiveOuter {
    inside: RecursiveInner;
}

contract RecursiveTest {
    val: RecursiveOuter;

    init() {
        self.val = RecursiveOuter{
            inside: RecursiveInner{
                nested: RecursiveDeeper{
                    field: 42
                }
            }
        };
    }
}
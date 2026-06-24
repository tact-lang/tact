struct NestedOptionalDeeper {
    n1: Level1?;
}

struct Level1 {
    n2: Level2?;
}

struct Level2 {
    val: Int?;
}

contract Test {
    data: NestedOptionalDeeper;

    init() {
        self.data = NestedOptionalDeeper{
            n1: Level1{
                n2: Level2{
                    val: null,
                },
            },
        };
    }
}
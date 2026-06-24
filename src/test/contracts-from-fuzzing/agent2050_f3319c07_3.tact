struct NestedLevel3 {
    val1: Int;
    val2: Bool?;
}

struct NestedLevel2 {
    nested3: NestedLevel3;
    val3: String?;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
    val4: Cell;
}

contract DeepNest {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            nested2: NestedLevel2{
                nested3: NestedLevel3{
                    val1: 42,
                    val2: true
                },
                val3: null
            },
            val4: emptyCell()
        };
    }
}
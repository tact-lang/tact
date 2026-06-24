struct Level2 { level2Int: Int }
struct Level1 { level1Struct: Level2 }
struct Root    { rootField: Level1 }

contract DeepNestedStruct {
    deep: Root;

    init() {
        self.deep = Root{ rootField: Level1{ level1Struct: Level2{ level2Int: 7 } } };
    }
}
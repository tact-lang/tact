struct Level3 { val: Int }
struct Level2 { nested: Level3 }
struct Level1 { nested: Level2 }

contract DeepNestedStruct {
    data: Level1;

    init() {
        self.data = Level1{ nested: Level2{ nested: Level3{ val: 123 } } };
    }
}
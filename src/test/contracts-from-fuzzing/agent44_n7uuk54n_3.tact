struct Level1 { Value: Int }
struct Level2 { L1: Level1 }
struct Level3 { L2: Level2 }
struct Level4 { L3: Level3 }
struct Level5 { L4: Level4 }

contract DeepNestedTest {
    receive() {
        let nested = Level5 { L4: Level4 { L3: Level3 { L2: Level2 { L1: Level1 { Value: 42 } } } } };
        let extracted: Int = nested.L4.L3.L2.L1.Value;
        dump(extracted);
    }
}

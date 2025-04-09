struct Level4 { val: Int; }
struct Level3 { next: Level4; }
struct Level2 { next: Level3; }
struct Level1 { next: Level2; }

contract DeepHierarchyTest {
    data: Level1;

    init() {
        self.data = Level1{ next: Level2{ next: Level3{ next: Level4{ val: 42 } } } };
    }
}
// mutually nested optional structs nested very deep
struct Level5 { val: Int }
struct Level4 { deep: Level5? }
struct Level3 { deep: Level4? }
struct Level2 { deep: Level3? }
struct Level1 { deep: Level2? }

contract DeepOptionalStorage {
  nested: Level1;

  init() {
    self.nested = Level1{ deep: Level2{ deep: Level3{ deep: Level4{ deep: Level5{ val: 777 } } } } };
  }
}

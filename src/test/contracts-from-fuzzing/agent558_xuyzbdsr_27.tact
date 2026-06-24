// deeply nested struct, optional middle
struct LevelOne { v: Int; }
struct LevelTwo { inner: LevelOne; }
struct LevelThree { deep: LevelTwo?; }

contract Test {
  lvl: LevelThree = LevelThree{ deep: null };
}
// Deep optional & nested structs with mixed primitive optional leaves
struct LeafA { a: Int?; }
struct LeafB { b: Bool?; }
struct Mid {
  la: LeafA?;
  lb: LeafB?;
}

contract TestContract {
  m: Mid?;

  init() {
    self.m = Mid{
      la: LeafA{ a: null },
      lb: null
    };
  }
}
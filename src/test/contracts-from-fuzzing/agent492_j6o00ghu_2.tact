struct Level3 {
  a: Int;
  b: Bool;
  s: String;
}

struct Level2 {
  nested: Level3;
  optionalNested: Level3?;
  intVal: Int;
}

struct Level1 {
  nested: Level2;
  flag: Bool;
  optionalNested: Level2?;
}

contract NestedLevels {
  data: Level1;

  init() {
    self.data = Level1{
      nested: Level2{
        nested: Level3{a: 7, b: true, s: ""},
        optionalNested: null,
        intVal: 1
      },
      flag: false,
      optionalNested: null
    };
  }
}

struct LevelThree {
 a: Int;
 b: Bool?;
}

struct LevelTwo {
 c: LevelThree;
 d: String?;
}

struct LevelOne {
 e: LevelTwo;
 f: Int?;
}

contract DeepMultiStruct {
 data: LevelOne;
 init() {
  self.data = LevelOne{
   e: LevelTwo{
    c: LevelThree{a: 1, b: null},
    d: null
   },
   f: null
  };
 }
}

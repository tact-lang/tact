struct NestedMultiStruct {
  s1: Level1;
}

struct Level1 {
  s2: Level2;
}

struct Level2 {
  s3: Level3;
}

struct Level3 {
  a: Int;
  b: Bool;
  c: String;
}

contract TestNestedMultiStruct {
  data: NestedMultiStruct;

  init() {
    self.data = NestedMultiStruct{
      s1: Level1{
        s2: Level2{
          s3: Level3{a: 10, b: true, c: "deep"}
        }
      }
    };
  }
}

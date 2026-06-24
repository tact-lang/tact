struct Levels {
  d1: Int;
  d2: Int?;
  d3: Int;
  d4: Int?;
  d5: Int;
  d6: Int?;
}

contract LevelFields {
  foo: Levels;

  init() {
    self.foo = Levels{
      d1:1,d2:null,d3:3,d4:null,d5:5,d6:null
    };
  }
}
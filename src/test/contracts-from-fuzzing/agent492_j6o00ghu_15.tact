struct FlatStruct {
  a: Int;
  b: Bool;
  c: String;
}

struct OuterManyFlats {
  x: FlatStruct;
  y: FlatStruct;
  z: FlatStruct;
}

contract ManyFlatNested {
  data: OuterManyFlats;

  init() {
    self.data = OuterManyFlats{
      x: FlatStruct{a:1,b:true,c:""},
      y: FlatStruct{a:2,b:false,c:"hi"},
      z: FlatStruct{a:3,b:true,c:""},
    };
  }
}

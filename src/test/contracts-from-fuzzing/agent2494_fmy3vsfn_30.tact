struct Flags {
  a: Bool;
  b: Bool;
}

struct Ints {
  x: Int;
  y: Int;
}

struct Mix {
  fl: Flags;
  ints: Ints;
}

contract ComboStore {
  data: Mix = Mix{
    fl: Flags{a:true,b:false},
    ints: Ints{x:10,y:20}
  };
}
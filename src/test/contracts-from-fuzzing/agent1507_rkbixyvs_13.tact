struct Flat {
  a: Int;
  b: Bool;
  c: String;
}

struct NestedArray {
  f1: Flat;
  f2: Flat;
  f3: Flat;
}

contract MultipleStructs {
  many: NestedArray;

  init() {
    self.many = NestedArray{
      f1: Flat{ a:1, b:true, c:"A" },
      f2: Flat{ a:2, b:false, c:"B" },
      f3: Flat{ a:3, b:true, c:"C" }
    };
  }
}

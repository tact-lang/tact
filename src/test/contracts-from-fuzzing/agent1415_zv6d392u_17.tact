struct MultiLayer {
  a: Int;
  b: Level1;
  c: NestedOptionals;
}

struct Level1 {
  foo: Int;
  subopt: NestedOptionals;
}

struct NestedOptionals {
  one: Int?;
  two: Bool?;
  three: String?;
}

contract TestContract {
  m: MultiLayer;

  init() {
    self.m = MultiLayer{
      a: 1,
      b: Level1{
        foo: 2,
        subopt: NestedOptionals{one:null, two:true, three:null},
      },
      c: NestedOptionals{one:5, two:null, three:"hi"}
    };
  }
}
struct NestedStructWithOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct DoubleNested {
  first: NestedStructWithOptionals;
  second: NestedStructWithOptionals;
}

contract TestContract {
  nested: DoubleNested;
  init() {
    self.nested = DoubleNested{
      first: NestedStructWithOptionals{a:null,b:null,c:null},
      second: NestedStructWithOptionals{a:null,b:true,c:"hello"}
    };
  }
}
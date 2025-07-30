struct ComplexOne {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Builder;
  g: Slice;
  h: Int?;
}

struct ComplexTwo {
  ci: ComplexOne;
  flag: Bool?;
  text: String;
}

contract ManyNestedFields {
  data1: ComplexOne;
  data2: ComplexTwo;

  init() {
    self.data1 = ComplexOne{
      a:1, b:true, c:"q", d:myAddress(), e:emptyCell(), f:beginCell(), g:emptyCell().asSlice(), h:null
    };
    self.data2 = ComplexTwo{
      ci: self.data1,
      flag: false,
      text: "hi"
    };
  }
}
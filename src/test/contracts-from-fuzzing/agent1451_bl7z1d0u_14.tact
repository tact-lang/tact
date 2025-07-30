struct OptionalNested {
  a: Int?;
  b: Sub?;
}

struct Sub {
  x: Int?;
  y: Bool?;
}

contract OptNestedFields {
  val: OptionalNested;

  init() {
    self.val = OptionalNested{
      a: null,
      b: Sub{x:null,y:true}
    };
  }
}

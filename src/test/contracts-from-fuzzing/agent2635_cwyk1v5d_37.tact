// Nested optional in a struct default (nested single layer, allowed)

struct Optionalest {
  foo: Int?;
}

contract OptInStruct {
  v: Optionalest;

  init(){
    self.v = Optionalest{
      foo: null
    };
  }
}
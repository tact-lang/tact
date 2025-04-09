struct Layered {
  foo: Int;
  bar: Bool;
}

struct Wrapper {
  a: Layered;
  b: Layered;
}

contract StackStructs {
  wrap: Wrapper;
  init(){
    self.wrap=Wrapper{a:Layered{foo:5,bar:true},b:Layered{foo:15,bar:false}};
  }
}
struct Inner1 { a: Int }
struct Inner2 { b: Int }

struct Container {
  i1: Inner1?;
  i2: Inner2?;
}

contract OptStructFields {
  val: Container;

  init() {
    self.val = Container{i1:null, i2:null};
  }
}
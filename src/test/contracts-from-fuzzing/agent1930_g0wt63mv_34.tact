struct DeepMandatory {
  l1: Inner;
}

struct Inner {
  l2: Inner2;
}

struct Inner2 {
  l3: Inner3;
}

struct Inner3 {
  x: Int;
}

contract ForceNested {
  obj: DeepMandatory;

  init() {
    self.obj = DeepMandatory{
      l1: Inner{
        l2: Inner2{
          l3: Inner3{ x: 1 }
        }
      }
    };
  }
}
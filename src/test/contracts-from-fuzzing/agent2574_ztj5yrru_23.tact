struct NestedCompose {
  in1: Int;
  opt1: Bool?;
}

struct NestedHolder {
  p: NestedCompose;
}

contract OptInStruct {
  z: NestedHolder;

  init() {
    self.z = NestedHolder{
      p: NestedCompose{ in1: 1, opt1: null }
    };
  }
}
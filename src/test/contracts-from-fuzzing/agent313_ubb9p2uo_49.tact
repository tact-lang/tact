struct NestedAssigned {
  aa: Int;
  bb: Bool;
}

contract NestedAssign {
  val: NestedAssigned;

  init() {
    let temp = NestedAssigned{ aa:99, bb:true };
    self.val = temp;
  }
}
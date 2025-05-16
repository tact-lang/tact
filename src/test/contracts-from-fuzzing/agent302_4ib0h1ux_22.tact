struct Some {
  a: Int;
  b: Bool;
}

struct ContainerOpt {
  inner: Some?;
}

contract OptWrap {
  val: ContainerOpt;

  init() {
    self.val = ContainerOpt{
      inner: Some{
        a: 123,
        b: true
      }
    };
  }
}
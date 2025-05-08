struct Chain3 {
  next: Chain4;
}
struct Chain4 {
  next: Chain5;
}
struct Chain5 {
  val: Int;
}

contract ChainNested {
  data: Chain3;

  init() {
    self.data = Chain3{
      next: Chain4{
        next: Chain5{
          val: 99,
        },
      },
    };
  }
}

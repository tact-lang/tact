struct Chain1 {
  next: Chain2;
  val: Int;
}

struct Chain2 {
  next: Chain3;
  val: Int;
}

struct Chain3 {
  val: Int;
}

contract LongChain {
  data: Chain1;

  init() {
    self.data = Chain1{
      val: 1,
      next: Chain2{
        val:2,
        next: Chain3{
          val:3,
        },
      },
    };
  }
}
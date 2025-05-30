struct DeepOptX {
  val: Int?;
  next: DeepOptY?;
}

struct DeepOptY {
  flag: Bool?;
  next: DeepOptZ?;
}

struct DeepOptZ {
  number: Int?;
}

contract TestContract {
  opt: DeepOptX;

  init() {
    self.opt = DeepOptX{
      val: null,
      next: null
    };
  }
}
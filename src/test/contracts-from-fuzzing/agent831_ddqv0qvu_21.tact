struct ManyOptional {
  op1: Int?;
  op2: Int?;
  op3: Bool?;
  op4: String?;
  op5: Address?;
}

contract OptsContract {
  val: ManyOptional;
  init() {
    self.val = ManyOptional{
      op1: null,
      op2: 42,
      op3: null,
      op4: "hello",
      op5: null
    };
  }
}
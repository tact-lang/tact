struct NestedOptionals {
  in1: Int?;
  in2: Bool?;
  in3: Address?;
  in4: Cell?;
  in5: Slice?;
}

contract OptNestedTest {
  opt: NestedOptionals;

  init() {
    self.opt = NestedOptionals{
      in1: null,
      in2: false,
      in3: null,
      in4: emptyCell(),
      in5: emptyCell().asSlice()
    };
  }
}
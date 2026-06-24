struct MultiOptionals {
  f1: Int?;
  f2: String?;
  f3: Bool?;
  f4: Address?;
  f5: Cell?;
  f6: Slice?;
  f7: Builder?;
}

contract TestContract {
  manyOpts: MultiOptionals;
  init() {
    self.manyOpts = MultiOptionals{
      f1: 0, f2: null, f3: true, f4: null, f5: null, f6: null, f7: null
    };
  }
}
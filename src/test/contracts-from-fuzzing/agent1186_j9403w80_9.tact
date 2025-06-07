struct DeepStrOptLevel2 {
  s2: String?;
}

struct DeepStrOptLevel1 {
  s1: String?;
  next: DeepStrOptLevel2;
}

contract DeepOptionalStringsContract {
  data: DeepStrOptLevel1;

  init() {
    self.data = DeepStrOptLevel1{
      s1: null,
      next: DeepStrOptLevel2{
        s2: "deeply nested",
      },
    };
  }
}

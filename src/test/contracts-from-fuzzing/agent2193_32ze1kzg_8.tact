struct DeepOptionalLevel3 {
  value: Int?;
}

struct DeepOptionalLevel2 {
  next: DeepOptionalLevel3?;
}

struct DeepOptionalLevel1 {
  next: DeepOptionalLevel2?;
}

contract TestContract {
  data: DeepOptionalLevel1;

  init() {
    self.data = DeepOptionalLevel1{
      next: DeepOptionalLevel2{
        next: DeepOptionalLevel3{
          value: null
        }
      }
    };
  }
}
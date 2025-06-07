struct DeepOptionalNest1 { x: Int?; }
struct DeepOptionalNest2 { prev: DeepOptionalNest1?; }
contract DeepDoubleOptional {
  data: DeepOptionalNest2?;
  init() {
    self.data = DeepOptionalNest2{
      prev: DeepOptionalNest1{ x: 123 }
    };
  }
}
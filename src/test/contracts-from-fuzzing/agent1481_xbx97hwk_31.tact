// Test deeply nested optionals inside inner struct
struct InnerMostOpt {
  x: Int?;
}
struct MidOpt {
  inner: InnerMostOpt?;
}
struct TopOpt {
  mid: MidOpt?;
}
contract DeepOptional {
  data: TopOpt;
  init() {
    self.data = TopOpt{ mid: MidOpt{ inner: null } };
  }
}
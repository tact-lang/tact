struct InnerMost {
  field: Int;
}
struct MidLevel {
  inner: InnerMost;
}
struct HighLevel {
  mid: MidLevel;
}
contract Cascade {
  x: HighLevel;
  init() {
    self.x = HighLevel{ mid: MidLevel{ inner: InnerMost{ field: 7 } } };
  }
}
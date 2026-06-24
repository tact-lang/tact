struct SLevel3 {
  inner: Int;
}
struct SLevel2 {
  inner: SLevel3;
}
struct SLevel1 {
  inner: SLevel2;
}

contract ChainNested {
  data: SLevel1;

  init() {
    self.data = SLevel1{inner: SLevel2{inner: SLevel3{inner: 123}}};
  }
}
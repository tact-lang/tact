struct OptLevel1 { inner: OptLevel2?; val: Int; }
struct OptLevel2 { inner: OptLevel3?; flag: Bool; }
struct OptLevel3 { text: String?; num: Int?; }

contract NestedOptionals {
  value: OptLevel1;

  init() {
    self.value = OptLevel1{
      inner: null,
      val: 7
    };
  }
}
struct DeepBottom { val: Int; }

struct MidLevel2 { inner: DeepBottom?; }

struct MidLevel1 { inner: MidLevel2?; }

struct TopLevel { inner: MidLevel1?; }

contract PartialOptInit {
  state: TopLevel;

  init() {
    self.state = TopLevel{
      inner: MidLevel1{
        inner: null   // Intentionally setting inner null
      }
    };
  }
}
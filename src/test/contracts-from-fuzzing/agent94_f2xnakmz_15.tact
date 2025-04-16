struct VeryDeep1 { inner: Int; }
struct VeryDeep2 { inner: VeryDeep1; }
struct VeryDeep3 { inner: VeryDeep2; }
struct VeryDeep4 { inner: VeryDeep3; }

contract DeepChain {
  data: VeryDeep4;

  init() {
    self.data = VeryDeep4{
      inner: VeryDeep3{
        inner: VeryDeep2{
          inner: VeryDeep1{
            inner: 42
          }
        }
      }
    };
  }
}
struct DeepNest1 { n: DeepNest2 }
struct DeepNest2 { n: DeepNest3 }
struct DeepNest3 { n: DeepNest4 }
struct DeepNest4 { leaf: Int? }

contract Test {
  d: DeepNest1;

  init() {
    self.d = DeepNest1{
      n: DeepNest2{
        n: DeepNest3{
          n: DeepNest4{
            leaf: null
          }
        }
      }
    };
  }
}

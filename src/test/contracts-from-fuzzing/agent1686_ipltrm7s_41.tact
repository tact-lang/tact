struct DeepNest1 { val: Int; }
struct DeepNest2 { inner: DeepNest1; }
struct DeepNest3 { inner: DeepNest2; }
struct DeepNest4 { inner: DeepNest3; }
struct DeepNest5 { inner: DeepNest4; }
struct DeepNest6 { inner: DeepNest5; }
struct DeepNest7 { inner: DeepNest6; }

contract SevenNest {
  data: DeepNest7;

  init() {
    self.data = DeepNest7{
      inner: DeepNest6{
       inner: DeepNest5{
        inner: DeepNest4{
         inner: DeepNest3{
          inner: DeepNest2{
           inner: DeepNest1{val:777}
          }
         }
        }
       }
      }
    };
  }
}
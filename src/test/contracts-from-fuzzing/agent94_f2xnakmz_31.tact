struct VeryDeepS1 { a: Int; }
struct VeryDeepS2 { s: VeryDeepS1; }
struct VeryDeepS3 { s: VeryDeepS2; }
struct VeryDeepS4 { s: VeryDeepS3; }
struct VeryDeepS5 { s: VeryDeepS4; }

contract SuperDeepNest {
  data: VeryDeepS5;
  init() {
    self.data = VeryDeepS5{
      s: VeryDeepS4{
        s: VeryDeepS3{
          s: VeryDeepS2{
            s: VeryDeepS1{
              a: 777
            }
          }
        }
      }
    };
  }
}
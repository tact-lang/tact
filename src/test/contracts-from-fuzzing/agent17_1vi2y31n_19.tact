struct StrNest1 { s: String }
struct StrNest2 { inner: StrNest1 }
struct StrNest3 { inner: StrNest2 }
struct StrNest4 { inner: StrNest3 }
struct StrNest5 { inner: StrNest4 }

contract DeepStrings {
  val: StrNest5;

  init() {
    self.val = StrNest5{
      inner: StrNest4{
        inner: StrNest3{
          inner: StrNest2{
            inner: StrNest1{ s: "test" }
          }
        }
      }
    };
  }
}
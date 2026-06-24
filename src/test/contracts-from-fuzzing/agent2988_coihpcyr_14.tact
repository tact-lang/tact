struct Optionals {
  i: Int?;
  b: Bool?;
  s: String?;
}

struct Wrap1 { opt: Optionals }
struct Wrap2 { wrap1: Wrap1 }
struct Wrap3 { wrap2: Wrap2 }

contract MultiOptionalNested {
  val: Wrap3;
  init() {
    self.val = Wrap3{
      wrap2: Wrap2{
        wrap1: Wrap1{
          opt: Optionals{
            i: null, b: true, s: null
          }
        }
      }
    };
  }
}
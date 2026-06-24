struct Deep1 { a: Int }
struct Deep2 { p: Deep1 }
struct Deep3 { q: Deep2 }
struct Deep4 { r: Deep3 }
struct Deep5 { s: Deep4 }

contract DeepFive {
  data: Deep5;
  init() {
    self.data = Deep5{
      s: Deep4{
        r: Deep3{
          q: Deep2{
            p: Deep1{ a: 77 }
          }
        }
      }
    };
  }
}
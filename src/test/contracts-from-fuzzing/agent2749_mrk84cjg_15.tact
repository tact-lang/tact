struct Deep1 { s: String }
struct Deep2 { d1: Deep1 }
struct Deep3 { d2: Deep2 }
struct Deep4 { d3: Deep3 }

contract Inception {
  level: Deep4;

  init() {
    self.level = Deep4{
      d3: Deep3{
        d2: Deep2{
          d1: Deep1{
            s: "💤"
          }
        }
      }
    };
  }
}
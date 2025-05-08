struct WideInner {
  a: Int; b: Int; c: Int; d: Int; e: Int;
  f: Int; g: Int; h: Int; i: Int; j: Int;
}

struct Opt1 { inner: WideInner?; }
struct Opt2 { opt: Opt1?; }
struct Opt3 { opt: Opt2?; }
struct Opt4 { opt: Opt3?; }

contract DeepWideNested {
  val: Opt4;

  init() {
    self.val = Opt4{
      opt: Opt3{
        opt: Opt2{
          opt: Opt1{
            inner: WideInner{
              a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
            }
          }
        }
      }
    };
  }
}
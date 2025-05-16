contract NestedStructContract {
  s:Outer;

  init() {
    self.s=Outer{
      a:Inner1{
        b:Inner2{
          c:Inner3{
            d:99
          }
        }
      }
    };
  }
}

struct Outer { a:Inner1; }
struct Inner1 { b:Inner2; }
struct Inner2 { c:Inner3; }
struct Inner3 { d:Int; }
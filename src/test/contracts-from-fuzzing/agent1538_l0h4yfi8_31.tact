struct Inner { x: Int }
struct Middle { inn: Inner }
struct Outer { mid: Middle }

contract Test {
  storage: Outer?;
  
  init() {
    self.storage = Outer{
      mid: Middle{
        inn: Inner{ x: 55 }
      }
    };
  }
}
struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }
struct Inner3 { z: String; }
struct InnerTop { a: Inner1; b: Inner2; c: Inner3; }

contract MultipleStructNestings {
  f: InnerTop;

  init() {
    self.f = InnerTop{
      a: Inner1{x:7},
      b: Inner2{y:true},
      c: Inner3{z:"hi"}
    };
  }
}

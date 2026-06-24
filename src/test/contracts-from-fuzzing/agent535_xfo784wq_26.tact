struct Inner1 { x: Int }
struct Inner2 { x: Inner1 }
struct Inner3 { x: Inner2 }
struct Inner4 { x: Inner3 }
struct Inner5 { x: Inner4 }
struct Inner6 { x: Inner5 }

contract Deep6 {
  val: Inner6;

  init() {
    self.val = Inner6{ x: Inner5{ x: Inner4{ x: Inner3{ x: Inner2{ x: Inner1{ x:42 }}}}}};
  }
}
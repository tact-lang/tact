struct Inner1 { val: Int; }
struct Inner2 { inner: Inner1; }
struct Inner3 { inner: Inner2; }
struct Inner4 { inner: Inner3; }
struct Inner5 { inner: Inner4; }

contract FiveDeep {
  nested: Inner5;

  init() {
    self.nested = Inner5{
      inner: Inner4{
        inner: Inner3{
          inner: Inner2{
            inner: Inner1{ val: 42 }
          }
        }
      }
    };
  }
}

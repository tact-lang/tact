struct NestedDeeper {
  first: Inner1;
}

struct Inner1 {
  second: Inner2;
}

struct Inner2 {
  third: Inner3;
}

struct Inner3 {
  val: Int;
}

contract Test {
  v: NestedDeeper;
  init() {
    self.v = NestedDeeper{
      first: Inner1{
        second: Inner2{
          third: Inner3{
            val: 100
          }
        }
      }
    };
  }
}
struct InnerMost {
 a: Int; 
}
struct Middle {
 inner: InnerMost; 
}
struct OuterMost {
 mid: Middle; 
}

contract DeeplyNestedOptional {
  data: OuterMost?;

  init() {
    self.data = OuterMost{
      mid: Middle{
        inner: InnerMost{a:123}
      }
    };
  }
}
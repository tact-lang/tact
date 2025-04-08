struct DeepMore {
  val: Int;
}
struct More {
  val: Int;
  deepr: DeepMore;
}
struct EvenMore {
  one: Int;
  two: More;
}

contract OverNested {
  x: EvenMore;

  init() {
    self.x = EvenMore{
      one:3,
      two:More{
        val:4,
        deepr:DeepMore{val:5}
      }
    };
  }
}
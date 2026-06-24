struct DeepInner {
  val: Int;
}

struct Inner {
  deep: DeepInner;
}

struct Outer {
  nested: Inner;
}

contract Test {
  data: Outer = Outer{
    nested: Inner{
      deep: DeepInner{
        val: 42
      }
    }
  };
}
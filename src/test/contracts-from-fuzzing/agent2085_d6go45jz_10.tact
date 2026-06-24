struct NestedOptionals {
  inner: Inner?;
}

struct Inner {
  deep: Deeper?;
}

struct Deeper {
  val: Int?;
}

contract TestContract {
  data: NestedOptionals;

  init() {
    self.data = NestedOptionals{
      inner: Inner {
        deep: Deeper{
          val: null
        }
      }
    };
  }
}
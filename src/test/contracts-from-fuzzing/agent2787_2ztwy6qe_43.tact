struct Child {
  val: Int? = 5;
}

struct Parent {
  c: Child? = null;
}

contract ConflictDefaults {
  data: Parent;

  init() {
    self.data = Parent{
      c: Child{ val: null }    // explicitly override default to null (conflicting)
    };
  }
}

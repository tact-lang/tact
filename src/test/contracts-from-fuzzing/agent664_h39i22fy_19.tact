// nested optionals inside a struct inside contract storage
struct NestedOption {
  val: Int?;
  flag: Bool;
}

contract Test {
  data: NestedOption?;

  init() {
    self.data = null;
  }
}
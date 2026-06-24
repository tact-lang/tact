struct Inline { y: Int?; }

contract NestedOptStructsFixed {
  x: Inline?;

  init() {
    self.x = null;
  }
}

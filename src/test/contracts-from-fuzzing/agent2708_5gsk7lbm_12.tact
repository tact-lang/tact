struct NestedOptionals {
  innerOpt: String?;
}

contract InnerOptTest {
  item: NestedOptionals?;
  
  init() {
    self.item = null;
  }
}

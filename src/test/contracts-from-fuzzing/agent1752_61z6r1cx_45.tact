struct S {
  x: Int;
  y: Bool;
}

contract InitNestedUpdate {
  field: S;

  init() {
    self.field = S{x:1,y:true};
    self.field.x = 2;
    self.field.y = false;
  }
}
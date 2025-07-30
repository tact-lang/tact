struct EmptyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract EmptyManyOptionals {
  val: EmptyOptionals;

  init() {
    self.val = EmptyOptionals{a:null,b:null,c:null};
  }
}
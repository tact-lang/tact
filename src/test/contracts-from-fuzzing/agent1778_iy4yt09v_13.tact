struct Composite {
  i: Int;
  s: String;
  b: Bool;
  o: Int?;
}

contract AllTypes {
  one: Composite;

  init() {
    self.one = Composite{i:1,s:"hey",b:true,o:null};
  }
}
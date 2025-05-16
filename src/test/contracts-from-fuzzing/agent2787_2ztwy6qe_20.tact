struct Nested {
  i: Int;
  b: Bool;
}

contract LargeVars {
  f1: Int; f2: Bool; f3: String;
  f4: Int?; f5: Bool?; f6: String?;
  f7: Nested; f8: Nested;

  init() {
    self.f1=1; self.f2=true; self.f3="hi";
    self.f4=null; self.f5=false; self.f6="bye";
    self.f7=Nested{i:5,b:true};
    self.f8=Nested{i:7,b:false};
  }
}

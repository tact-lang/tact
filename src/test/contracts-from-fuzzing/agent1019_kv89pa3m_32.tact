struct Nested {
  f1: Int;
  f2: Bool;
  f3: String;
}

contract LargeFlat {
  x1: Nested;
  x2: Nested;
  x3: Nested;
  x4: Nested;
  x5: Nested;

  init() {
    self.x1=Nested{f1:1,f2:true,f3:"a"};
    self.x2=Nested{f1:2,f2:true,f3:"b"};
    self.x3=Nested{f1:3,f2:true,f3:"c"};
    self.x4=Nested{f1:4,f2:true,f3:"d"};
    self.x5=Nested{f1:5,f2:true,f3:"e"};
  }
}

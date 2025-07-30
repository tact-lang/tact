struct X { a: Int; b: String; }

contract ManyVars {
  var1: X;
  var2: X;
  var3: X;

  init() {
    self.var1 = X{a:1,b:"a"};
    self.var2 = X{a:2,b:"b"};
    self.var3 = X{a:3,b:"c"};
  }
}
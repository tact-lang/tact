struct Combine {
  a: Int;
  b: Bool;
  c: String;
}

contract Test {
  one: Combine;
  two: Combine;

  init() {
    self.one = Combine{a:1,b:true,c:"x"};
    self.two = Combine{a:2,b:false,c:"y"};
  }
}
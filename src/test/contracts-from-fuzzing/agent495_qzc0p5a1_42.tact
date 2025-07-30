// Optional of struct containing optionals
struct Inner {
  x: Int?;
}
struct Outer {
  inner: Inner?;
}
contract NestedOptOpt {
  st: Outer;
  init(){
    self.st = Outer{ inner: null };
  }
}
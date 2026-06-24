struct ManyStrings {
  foo: String;
  bar: String;
  baz: String;
  quux: String;
  abc: String;
}

contract LotsStrings {
  val: ManyStrings;

  init() {
    self.val = ManyStrings{
      foo:"a", bar:"b", baz:"c", quux:"d", abc:"e"
    };
  }
}
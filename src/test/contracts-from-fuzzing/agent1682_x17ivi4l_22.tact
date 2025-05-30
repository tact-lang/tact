struct HasManyStrings {
  a: String;
  b: String;
  c: String;
  d: String;
  e: String;
}

contract TestContract {
  val: HasManyStrings;

  init() {
    self.val = HasManyStrings{
      a:"A",b:"B",c:"C",d:"D",e:"E"
    };
  }
}
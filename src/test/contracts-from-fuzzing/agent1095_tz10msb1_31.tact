struct HasString {
  s: String;
}

contract FarStrings {
  x: HasString;
  y: HasString?;

  init() {
    self.x = HasString{s:"hello"};
    self.y = null;
  }
}
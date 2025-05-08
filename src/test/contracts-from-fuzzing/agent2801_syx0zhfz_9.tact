struct BigString {
  long: String;
}

contract HoldLongString {
  val: BigString;

  init() {
    self.val = BigString{
      long: "This is a very very very very very very very very very very long string!"
    };
  }
}
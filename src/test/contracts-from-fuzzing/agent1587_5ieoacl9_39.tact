struct Weird {
  i: Int;
  b: Bool;
  s: String;
  o: Int?;
}

contract WeirdFields {
  wf: Weird;

  init(){
    self.wf = Weird{ i: 7, b: true, s: "w", o: null };
  }
}
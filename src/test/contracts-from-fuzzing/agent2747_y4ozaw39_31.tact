struct OptionalOuter {
  val: Int; 
  optx: Int?;
  flag: Bool;
  txt: String;
}

contract OuterOptField {
  rec: OptionalOuter?;
  init() {
    self.rec = OptionalOuter{
      val: 5, optx: null, flag:true, txt:"hi"
    };
  }
}
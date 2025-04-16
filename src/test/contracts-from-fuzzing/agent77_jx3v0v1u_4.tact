struct Opts {
  si: Int?;
  sb: Bool?;
  ss: String?;
}

contract OptInStruct {
  val: Opts;

  init() {
    self.val = Opts{
      si: null, sb: true, ss: "hello"
    };
  }
}
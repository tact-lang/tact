struct JustOptional {
  f: Int?;
}

contract OptInStruct {
  data: JustOptional;

  init() {
    self.data = JustOptional{ f:null };
  }
}
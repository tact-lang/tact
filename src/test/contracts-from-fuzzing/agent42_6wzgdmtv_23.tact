struct ManyTypes {
  intf: Int;
  boolf: Bool;
  strf: String;
  opti: Int?;
  optb: Bool?;
  opts: String?;
}

contract TestContract {
  dat: ManyTypes;

  init() {
    self.dat = ManyTypes{
      intf:5,
      boolf:true,
      strf:"str",
      opti:null,
      optb:null,
      opts:null
    };
  }
}
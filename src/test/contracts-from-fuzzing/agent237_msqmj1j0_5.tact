struct WrappedAddrOpt {
  a: Address?;
}

struct HolderOpt {
  wa: WrappedAddrOpt;
  flag: Bool;
  txt: String;
}

contract ComplexFieldsOpt {
  def: Int = 42;
  rec: HolderOpt;

  init() {
    self.rec = HolderOpt{
      wa: WrappedAddrOpt{a: null},
      flag: true,
      txt: "hello"
    };
  }
}
// optional nested inside defaulted struct
struct DefOpt {
  flag: Bool = false;
  note: String?;
}

contract DefaultOptional {
  rec: DefOpt;

  init() {
    self.rec = DefOpt{};
  }
}
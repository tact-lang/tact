struct BigOpt {
  maybeInt: Int?;
  maybeBool: Bool?;
  maybeStr: String?;
  maybeAddr: Address?;
  maybeCell: Cell?;
}

contract BigOptContract {
  s: BigOpt;

  init() {
    self.s = BigOpt{
      maybeInt: null,
      maybeBool: null,
      maybeStr: null,
      maybeAddr: null,
      maybeCell: null
    };
  }
}
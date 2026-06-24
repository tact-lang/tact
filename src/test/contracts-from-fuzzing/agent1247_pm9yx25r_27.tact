struct MultOption {
  intOpt: Int?;
  boolOpt: Bool?;
  addrOpt: Address?;
  stringOpt: String?;
}

contract ManyOptionals {
    multi: MultOption;

    init() {
      self.multi = MultOption{
        intOpt: null,
        boolOpt: null,
        addrOpt: null,
        stringOpt: null
      };
    }
}
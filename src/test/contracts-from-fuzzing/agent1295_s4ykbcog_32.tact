// optional message nested in optional struct, persistent var optional container
message(0x8888) InnMsg {
  foo: Int;
}

struct WrapOpt {
  inn: InnMsg?;
}

contract OptionWrap {
  val: WrapOpt?;

  init() {
    self.val = WrapOpt{
      inn: InnMsg{ foo: 11 }
    };
  }
}
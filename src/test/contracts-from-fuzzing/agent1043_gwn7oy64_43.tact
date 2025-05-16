// Optional message
message MaybeMsg {} 

struct WrapMsgOpt {
  m: MaybeMsg?;
}

contract TestContract {
  wmo: WrapMsgOpt;
  init() {
    self.wmo = WrapMsgOpt{ m: null };
  }
}
struct TinyOption {
  o1: Int? as uint3;
  o2: Int? as int3;
}

contract TinyOptionWrap {
  t: TinyOption;

  init() {
    self.t = TinyOption{
      o1: null,
      o2: null
    };
  }
}
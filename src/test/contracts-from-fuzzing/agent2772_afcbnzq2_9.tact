struct SerializeVariants {
  si1: Int as int64;
  ui1: Int as uint64;
  si2: Int as int8;
  ui2: Int as uint8;
}

contract TestSerializeVariants {
  data: SerializeVariants;

  init() {
    self.data = SerializeVariants{
      si1: -5,
      ui1: 5,
      si2: -1,
      ui2: 255
    };
  }
}

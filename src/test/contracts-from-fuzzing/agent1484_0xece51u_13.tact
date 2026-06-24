struct SerializeStruct {
  s1: Int as uint32;
  s2: Int as int64;
  s3: Int as int257;
  flag: Bool;
}

contract SerializeInStruct {
  s: SerializeStruct;

  init() {
    self.s = SerializeStruct{
      s1: 100,
      s2: -1000,
      s3: 999999999,
      flag: true
    };
  }
}
struct SerFormats {
  i1: Int as int8;
  i2: Int as uint8;
  i3: Int as int64;
  i4: Int as uint64;
  i5: Int as int257;
}

contract SerializedNums {
  f: SerFormats = SerFormats{
    i1: -5,
    i2: 250,
    i3: 1111111111,
    i4: 2222222222,
    i5: 3333333333
  };

  init() {}
}
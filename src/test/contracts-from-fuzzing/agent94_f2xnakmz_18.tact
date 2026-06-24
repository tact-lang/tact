struct Outlier {
  big: Int as int257;
  small: Int as uint1;
  mid: Int as int128;
}

contract SerializationSizes {
  data: Outlier;

  init() {
    self.data = Outlier{
      big: -1,
      small: 1,
      mid: 0
    };
  }
}
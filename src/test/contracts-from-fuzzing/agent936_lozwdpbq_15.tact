struct HasFlags {
  small1: Int as uint4;
  small2: Int as uint4;
  small3: Int as uint4;
  small4: Int as uint4;
  big: Int;
}

contract TestContract {
  data: HasFlags;

  init() {
    self.data = HasFlags{
      small1: 1,
      small2: 2,
      small3: 3,
      small4: 4,
      big: 1000000000000000000,
    };
  }
}

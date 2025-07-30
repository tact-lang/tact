struct AllKinds {
  i: Int;  io: Int?;
  b: Bool;  bo: Bool?;
  s: String;  so: String?;
}

contract Permutations {
  data: AllKinds;

  init() {
    self.data = AllKinds{
      i: 10, io: null,
      b: true, bo: false,
      s: "s", so: null
    };
  }
}
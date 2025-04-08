struct Embed {
  alpha: Int;
  beta: String;
}

struct Wrapper {
  first: Embed;
  second: Embed;
}

contract StructOfStructs {
  giant: Wrapper;

  init() {
    self.giant = Wrapper{
      first: Embed{alpha: 1, beta: "a"},
      second: Embed{alpha: 2, beta: "b"},
    };
  }
}
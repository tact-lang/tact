struct MidLvl {
  s: String;
  f: Bool;
}

contract EmbedStruct {
  mid: MidLvl;

  init() {
    self.mid = MidLvl{ s: "hi", f: true };
  }
}
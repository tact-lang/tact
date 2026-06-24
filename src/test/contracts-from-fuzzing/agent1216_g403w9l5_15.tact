struct Points {
  x: Int;
  y: Int;
}

struct Info {
  label: String;
  desc: String?;
}

struct Mixed {
  pt: Points;
  info: Info;
  active: Bool;
}

contract MixedTest {
  m: Mixed;

  init() {
    self.m = Mixed{
      pt: Points{ x:5, y:10 },
      info: Info{ label:"lbl", desc:null },
      active: true,
    };
  }
}
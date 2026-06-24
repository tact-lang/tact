struct Outer {
  inner1: Int;
  inner2: Int;
  inner3: Int;
  inner4: Int;
  inner5: Int;
  inner6: Int;
  inner7: Int;
  inner8: Int;
  inner9: Int;
  inner10: Int;
  inner11: Int;
  inner12: Int;
  inner13: Int;
  inner14: Int;
  inner15: Int;
  inner16: Int;
  inner17: Int;
  inner18: Int;
  inner19: Int;
  inner20: Int;
}

contract BigFields {
  val: Outer;

  init() {
    self.val = Outer{
      inner1: 1,
      inner2: 2,
      inner3: 3,
      inner4: 4,
      inner5: 5,
      inner6: 6,
      inner7: 7,
      inner8:8,
      inner9:9,
      inner10:10,
      inner11:11,
      inner12:12,
      inner13:13,
      inner14:14,
      inner15:15,
      inner16:16,
      inner17:17,
      inner18:18,
      inner19:19,
      inner20:20,
    };
  }
}
struct Deprecated {
  _0: Int;
  _1: Int;
  _2: Int;
  _3: Int;
  _4: Int;
  _5: Int;
  _6: Int;
  _7: Int;
  _8: Int;
  _9: Int;
  _10: Int;
  _11: Int;
  _12: Int;
  _13: Int;
  _14: Int;
  _15: Int;
  _16: Int;
  _17: Int;
  _18: Int;
  _19: Int;
}

contract DeprecatedTest {
  val: Deprecated;
  init() {
    self.val = Deprecated{
      _0: 0, _1:1, _2:2, _3:3, _4:4, _5:5, _6:6, _7:7,
      _8:8, _9:9, _10:10, _11:11, _12:12, _13:13, _14:14, _15:15,
      _16:16, _17:17, _18:18, _19:19
    };
  }
}
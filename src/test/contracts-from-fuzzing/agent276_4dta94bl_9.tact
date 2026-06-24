struct ManyFields {
a0: Int; a1: Int; a2: Int; a3: Int; a4: Int; a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
a10: Int; a11: Int; a12: Int; a13: Int; a14: Int; a15: Int; a16: Int; a17: Int; a18: Int; a19: Int;
}

contract FlatHuge {
  big: ManyFields;

  init() {
    self.big = ManyFields{
      a0:1,a1:2,a2:3,a3:4,a4:5,a5:6,a6:7,a7:8,a8:9,a9:10,
      a10:11,a11:12,a12:13,a13:14,a14:15,a15:16,a16:17,a17:18,a18:19,a19:20,
    };
  }
}

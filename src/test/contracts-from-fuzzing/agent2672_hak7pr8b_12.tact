struct Large {
  a0: Int; a1: Int; a2: Int; a3: Int; a4: Int; a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
  a10: Int; a11: Int; a12: Int; a13: Int; a14: Int; a15: Int; a16: Int; a17: Int; a18: Int; a19: Int;
  a20: Int; a21: Int; a22: Int; a23: Int; a24: Int; a25: Int; a26: Int; a27: Int; a28: Int; a29: Int;
  a30: Int; a31: Int; a32: Int; a33: Int; a34: Int; a35: Int; a36: Int; a37: Int; a38: Int; a39: Int;
  a40: Int; a41: Int; a42: Int; a43: Int; a44: Int; a45: Int; a46: Int; a47: Int; a48: Int; a49: Int;
}

contract LargeStruct {
  big: Large;

  init() {
    self.big = Large {
      a0:1,a1:1,a2:1,a3:1,a4:1,a5:1,a6:1,a7:1,a8:1,a9:1,
      a10:1,a11:1,a12:1,a13:1,a14:1,a15:1,a16:1,a17:1,a18:1,a19:1,
      a20:1,a21:1,a22:1,a23:1,a24:1,a25:1,a26:1,a27:1,a28:1,a29:1,
      a30:1,a31:1,a32:1,a33:1,a34:1,a35:1,a36:1,a37:1,a38:1,a39:1,
      a40:1,a41:1,a42:1,a43:1,a44:1,a45:1,a46:1,a47:1,a48:1,a49:1
    };
  }
}
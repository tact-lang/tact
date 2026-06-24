struct Giant {
  a1:Int; a2:Int?; a3:Int; a4:Int?; a5:Int;
  a6:Int?; a7:Int; a8:Int?; a9:Int; a10:Int?;
  a11:Int; a12:Int?; a13:Int; a14:Int?; a15:Int;
  a16:Int?; a17:Int; a18:Int?; a19:Int; a20:Int?;
  a21:Int; a22:Int?; a23:Int; a24:Int?; a25:Int;
  a26:Int?; a27:Int; a28:Int?; a29:Int; a30:Int?;
  a31:Int; a32:Int?; a33:Int; a34:Int?; a35:Int;
  a36:Int?; a37:Int; a38:Int?; a39:Int; a40:Int?;
  a41:Int; a42:Int?; a43:Int; a44:Int?; a45:Int;
  a46:Int?; a47:Int; a48:Int?; a49:Int; a50:Int?;
}

contract TestContract {
  g: Giant;
  init() {
    self.g = Giant{
      a1:1,a2:null,a3:3,a4:null,a5:5,a6:null,a7:7,a8:null,a9:9,a10:null,
      a11:11,a12:null,a13:13,a14:null,a15:15,a16:null,a17:17,a18:null,a19:19,a20:null,
      a21:21,a22:null,a23:23,a24:null,a25:25,a26:null,a27:27,a28:null,a29:29,a30:null,
      a31:31,a32:null,a33:33,a34:null,a35:35,a36:null,a37:37,a38:null,a39:39,a40:null,
      a41:41,a42:null,a43:43,a44:null,a45:45,a46:null,a47:47,a48:null,a49:49,a50:null
    };
  }
}
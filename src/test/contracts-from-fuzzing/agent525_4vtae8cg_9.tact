struct BigStruct {
  a1: Int; a2: Bool; a3: String; a4: Int?;
  a5: String?; a6: Bool?; a7: Slice; a8: Cell;
  a9: Address; a10: Int; a11: Bool; a12: String;
  a13: Int?; a14: String?; a15: Cell; a16: Address;
  a17: Int; a18: Bool; a19: String; a20: Int?;
  a21: String?; a22: Bool?; a23: Slice; a24: Cell;
  a25: Address; a26: Int; a27: Bool; a28: String;
  a29: Int?; a30: String?; a31: Cell; a32: Address;
}

contract BigStorage {
  big: BigStruct;

  init() {
    self.big = BigStruct{
      a1:1,a2:true,a3:"a",a4:null,
      a5:null,a6:false,a7:emptyCell().asSlice(),a8:emptyCell(),
      a9:myAddress(),a10:2,a11:false,a12:"b",
      a13:3,a14:"hi",a15:emptyCell(),a16:myAddress(),
      a17:4,a18:true,a19:"c",a20:null,
      a21:null,a22:false,a23:emptyCell().asSlice(),a24:emptyCell(),
      a25:myAddress(),a26:5,a27:true,a28:"d",
      a29:null,a30:"ok",a31:emptyCell(),a32:myAddress(),
    };
  }
}
struct Many {
 a1: Int; a2: Bool; a3: String; a4: Int?; a5: Bool?; a6: String?;
 a7: Int; a8: Bool; a9: String; a10: Int?; a11: Bool?; a12: String?; 
}

contract Test {
  data: Many;

  init() {
    self.data = Many{
      a1:1, a2:true, a3:"x", a4:null, a5:false, a6:null,
      a7:7, a8:true, a9:"y", a10:10, a11:null, a12:"z"
    };
  }
}
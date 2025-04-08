struct LargeNested {
  a1: Int; b1: Bool; c1: String;
  a2: Int; b2: Bool; c2: String;
  a3: Int; b3: Bool; c3: String;
  a4: Int; b4: Bool; c4: String;
  a5: Int; b5: Bool; c5: String;
}

contract LargeStructTest {
  val: LargeNested;

  init() {
    self.val = LargeNested{
      a1:1,b1:true,c1:"a",
      a2:2,b2:false,c2:"b",
      a3:3,b3:true,c3:"c",
      a4:4,b4:false,c4:"d",
      a5:5,b5:true,c5:"e"
    };
  }
}
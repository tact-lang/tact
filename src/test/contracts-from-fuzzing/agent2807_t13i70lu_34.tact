struct BigGuy {
 a0: Int; a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
 a6: Int; a7: Int; a8: Int; a9: Int; a10: Int; a11: Int;
 b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool; b6: Bool;
 s1: String; s2: String;
}

contract HugeState {
 val: BigGuy;
 init() {
  self.val = BigGuy{
    a0:0,a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,a11:11,
    b1:true,b2:false,b3:true,b4:false,b5:true,b6:false,
    s1:"hi",s2:"ok"
  };
 }
}
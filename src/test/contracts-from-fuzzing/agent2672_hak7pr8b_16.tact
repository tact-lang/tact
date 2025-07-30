struct ManyStrings {
 s0:String; s1:String; s2:String; s3:String; s4:String;
 s5:String; s6:String; s7:String; s8:String; s9:String;
}

contract StringHeavy {
 storage: ManyStrings;
 init() {
  self.storage = ManyStrings {
    s0:"a", s1:"b", s2:"c", s3:"d", s4:"e",
    s5:"f", s6:"g", s7:"h", s8:"i", s9:"j"
  };
 }
}
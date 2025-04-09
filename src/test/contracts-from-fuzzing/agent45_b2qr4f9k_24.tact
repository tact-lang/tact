struct ManyOptionalStrings {
  s1:String?; s2:String?; s3:String?;
  s4:String?; s5:String?; s6:String?;
}

contract OptStrs {
  val: ManyOptionalStrings;

  init() {
    self.val=ManyOptionalStrings{
      s1:null,s2:"b",s3:null,s4:"d",s5:null,s6:"f"
    };
  }
}
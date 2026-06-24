struct Boo {
  b: Bool;
  o: Int?;
}

contract BoolAndOpt {
  data: Boo;
  init(){self.data=Boo{b:true,o:null};}
}
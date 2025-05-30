struct Mix {
 intF: Int;
 boolF: Bool;
 strF: String;
 intOpt: Int?;
 boolOpt: Bool?;
 strOpt: String?;
}

contract TestMix {
 data: Mix;
 init() {
  self.data = Mix{
    intF:1, boolF:true, strF:"a", intOpt:null, boolOpt:false, strOpt:null
  };
 }
}

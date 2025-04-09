struct LongNest {
  a:Int; b:Int?; c:Int; d:Int?; e:Int; f:Int?;
}

contract LongNestCont {
  field: LongNest;

  init(){
    self.field = LongNest{
      a:1, b:null, c:2, d:null, e:3, f:null
    };
  }
}
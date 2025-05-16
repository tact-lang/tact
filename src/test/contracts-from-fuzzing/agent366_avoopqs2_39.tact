struct BoolInts {
 b1: Bool;
 b2: Bool;
 i1: Int;
 i2: Int;
}

contract MixTypesVars {
 data: BoolInts;
 init() {
  self.data = BoolInts{
    b1:true,b2:false,i1:10,i2:20
  };
 }
}
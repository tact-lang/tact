// contract with very large number of primitive persistent fields
contract Test15 {
 f1:Int; f2:Int; f3:Bool; f4:Bool; f5:String; f6:String; f7:Cell; f8:Slice;

 init() {
  self.f1=1; self.f2=2; self.f3=true; self.f4=false; self.f5="x"; self.f6="y";
  self.f7=emptyCell(); self.f8=self.f7.asSlice();
 }
}
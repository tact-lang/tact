struct PrimitiveDefaults {
  a:Int=0;
  b:Bool=false;
  c:String="";
}

contract PrimDefaults {
  data: PrimitiveDefaults;

  init() {
    self.data = PrimitiveDefaults{};
  }

  receive() {
    let _=self.data;
  }
}
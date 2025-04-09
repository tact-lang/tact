struct ManyOptionals{
  a:Int?; b:Bool?; c:Address?; d:String?; e:Cell?; f:Slice?; g:Builder?;
}
contract ManyOptStruct {
 s: ManyOptionals;
 init(){
  self.s = ManyOptionals{
    a:null, b:true, c:null, d:"str", e:null, f:null, g:null
  };
 }
}
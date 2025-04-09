struct Stuff {
 x: Int;
 y: Bool;
 z: String;
}

contract OptionalPlusDefault {
 opt: Stuff? = null;

 init() {
  self.opt = Stuff{ x:1,y:true,z:"x" };
 }
}
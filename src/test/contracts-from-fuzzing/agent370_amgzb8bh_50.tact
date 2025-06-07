struct Compose {
 a: Int;
 b: Bool;
 c: String;
}

contract ManyCompose {
  x: Compose;
  y: Compose;
  z: Compose;

  init() {
    self.x = Compose{ a:1,b:true,c:"x" };
    self.y = Compose{ a:2,b:false,c:"y" };
    self.z = Compose{ a:3,b:true,c:"z" };
  }
}